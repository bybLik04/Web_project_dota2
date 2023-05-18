import re
from bottle import post, request, template
from datetime import datetime
import json

payment = {}  # словарь для хранения почты, имени пользователя и номера телефона

@post('/orders', method='post')
def payments():
    mail = request.forms.get('email')  # получаем значение полей из формы
    name = request.forms.get('firstname')
    phone = request.forms.get('phone')
    cardnum = request.forms.get('cardnumber')

    if not mail_valid(mail):  # вызов функции проверки почты
        error_msg = "Неверный адрес почты"
        return template("orders.tpl", msg=error_msg, year=datetime.now().year)

    if not validate_phone_number(phone):  # вызов функции проверки номера телефона
        error_msg = "Неверный номер телефона"
        return template("orders.tpl", msg=error_msg, year=datetime.now().year)

    if not validate_full_name(name):  # вызов функции проверки ФИО
        error_msg = "Неверно введено ФИО"
        return template("orders.tpl", msg=error_msg, year=datetime.now().year)

    if not validate_credit_card_number(cardnum):  # вызов функции проверки номера карты
        error_msg = "Неверный номер карты"
        return template("orders.tpl", msg=error_msg, year=datetime.now().year)

    if phone in payment:  # проверяем, есть ли уже данные от этого пользователя
        payment[phone][0] = name  # обновляем имя пользователя в словаре
        if mail not in payment[phone][1:]:  # проверяем, что такая почта еще не была задана пользователем
            payment[phone].append(mail)  
    else:
        payment[phone] = [name, mail]  # добавляем нового пользователя и его почту в словарь

    with open('payments.json', 'w') as json_file:  # открываем файл 'payments.json' для записи
        json.dump(payment, json_file, indent=4)  # записываем содержимое словаря в файл

    access_date = datetime.now().strftime("%Y-%m-%d")  # переменная с текущей датой в формате 'ГГГГ-ММ-ДД'
    success_msg = f"Спасибо за покупку, {name}! Вся информация выслана вам на почту {mail}. Дата оформления: {access_date}"
    return template("orders.tpl", msg=success_msg, year=datetime.now().year)   # возвращаем шаблон с сообщением


def mail_valid(email): # функция проверки почты соответсвию паттерну
    email_pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,}(?:\.[a-zA-Z]{2,})?$' # паттерн для проверки валидности email адреса
    return re.match(email_pattern, email)

def validate_phone_number(phone_number):
    pattern = r"\+[7]+\d{10}"
    return re.match(pattern, phone_number)

def validate_full_name(full_name):
    pattern = r"(\w+)\s+(\w+)\s+(\w+)"
    return re.match(pattern, full_name) is not None

def validate_credit_card_number(card_number):
    pattern = r"\d{16}"
    return re.match(pattern, card_number)
