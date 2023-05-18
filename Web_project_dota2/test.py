import unittest
from payment import mail_valid, validate_phone_number

class TestEmailValidation(unittest.TestCase):
    
    def test_valid_email(self):
        list_mail_cor = ["m.m@mail.ru", "m1@gmail.com", "m-123@ya.ru", "a@b.co.uk", "a.b.c@mail.ru"]
        for mail in list_mail_cor:
            self.assertTrue(mail_valid(mail))

    def test_invalid_email(self):
        list_mail_uncor = ["", "1", "m1@", "@mail", "m@mail.", "m@mail..ru", "m@mail", "m@@mail.ru", 
                           "m@mail.ru.", "m@.mail.ru", "m@mail..com", "m@@mail.ru", "a@b.co..uk"]
        for mail in list_mail_uncor:
            self.assertFalse(mail_valid(mail))

class TestPhoneNumberValidation(unittest.TestCase):
    
    def test_valid_phone_number(self):
        list_phone_numbers = ["+78005553535", "+79123456789", "+71234567890"]
        for phone_number in list_phone_numbers:
            self.assertTrue(validate_phone_number(phone_number))

    def test_invalid_phone_number(self):
        list_invalid_phone_numbers = ["", "+", "+7", "+7800", "+791234567", "1234567890", "abcd", "+7qertyuoou", "+asfdsghfdh"]
        for phone_number in list_invalid_phone_numbers:
            self.assertFalse(validate_phone_number(phone_number))

if __name__ == '__main__':
    unittest.main()