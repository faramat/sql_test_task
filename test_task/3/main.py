import pymysql,datetime
from config import host,user,password,db_name
from prettytable import from_db_cursor
from decimal import Decimal

def connect():
    try:
        connection = pymysql.connect(
            host = host,
            port = 3306,
            user = user,
            password = password,
            database = db_name,
        )
        print("Successfully connected...")
    except pymysql.OperationalError as ex:
        print("Connection refused...")
        print(ex)

    try:
        cursor = connection.cursor()
    except pymysql.Error as ex:
        print("Error cursor")
        print(ex)

    return connection,cursor

def main():
    #передаем переменные подключения к дб
    con,cur = connect()
    #отображаем таблицу человек
    cur.execute("SELECT * FROM person")
    select_from_person = from_db_cursor(cur)
    print(select_from_person)
    #вытаскиваем заявку по id человека
    touch_id = input("Для просмотра заявок человека напишите его ID (например: 13): ")
    cur.execute(f"SELECT * FROM application_parameters WHERE person_person_id = {touch_id}")
    select_from_application_parameters = from_db_cursor(cur)
    print(select_from_application_parameters)
    #вытаскиваем данные ставки,суммы,срока по id заявки 
    touch_application_id = input("Напишите ID заявки по которой рассчитать график аутетных платежей (например: 13):")
    cur.execute(f"SELECT sum_total,lending_rate,credit_term FROM application_parameters WHERE application_id={touch_application_id};")
    info_credit = cur.fetchall()
    info_credit = str(info_credit) # превращаем кортеж в строку и форматируем ее в читаемый вид для передачи данных в переменные
    info_credit = info_credit.replace(")","").replace("(","").replace("Decimal","").replace("'","")
    info_credit = info_credit.split(",")
    del info_credit[3]
    #Получили данные
    sum_Total = Decimal(info_credit[0])
    lending_Rate = Decimal(info_credit[1])
    P = lending_Rate/100/12 # доля процентной ставки (в месяц)
    credit_Time = int(info_credit[2])
    i = 1
    #Расчет аутетного платежа
    # Печатает информацию исходя из заявки
    print(datetime.datetime.now(), f'|Сумма кредита: {int(sum_Total)} руб.')
    print(datetime.datetime.now(), f'|Ставка: {lending_Rate}%')
    print(datetime.datetime.now(), f'|Срок: {credit_Time} месяцев')
    print(datetime.datetime.now(), "|Месяц | Ежемесячный платеж | Основной долг | Долг по процентам | Остаток основного долга")
    start_time = datetime.datetime.now() # Замеряем скорость работы вычислений для дальнейшего отображения
    for i in range(credit_Time):
        #доля процентов в ежемесячном платеже 
        procent = sum_Total*P
        #Размер ежемесячного платежа
        pay_every_month = sum_Total*(P+(P/(pow((1+P),credit_Time)-1)))
        #Расчитываем основной долг
        osnovnoy_dolg = pay_every_month - procent
        #Расчитываем остаток основного долга
        ostatok_dolga = sum_Total - osnovnoy_dolg
        #Вывод данных
        sum_Total = ostatok_dolga
        credit_Time-=1
        procent = round(procent,2) #округление для вывода
        pay_every_month = round(pay_every_month,2)
        osnovnoy_dolg = round(osnovnoy_dolg,2)
        ostatok_dolga = round(ostatok_dolga,2)
        print(datetime.datetime.now(),"|",i+1,"|",pay_every_month,"|",osnovnoy_dolg,"|",procent,"|",ostatok_dolga)
    print("-"*20)
    print("Скорость работы вычислений = ",datetime.datetime.now() - start_time)
    cur.close()
    con.close()
if __name__ == "__main__":
    main()

