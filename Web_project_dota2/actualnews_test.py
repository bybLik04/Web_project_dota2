import unittest
from bottle import Bottle, template
from webtest import TestApp

class ActualNewsTest(unittest.TestCase):
    def setUp(self):
        # Создаем экземпляр приложения Bottle
        self.app = Bottle()

        # Маршруты для страницы actualnews
        @self.app.route('/actualnews')
        def actualnews():
            comments = [{'nickname': 'John', 'comment': 'Test comment'}]  # Пример комментария
            return template('actualnews', comments=comments)

    def test_actualnews_page(self):
        # Создаем экземпляр тестового приложения с использованием модуля webtest
        test_app = TestApp(self.app)

        # Выполняем GET-запрос к странице actualnews
        response = test_app.get('/actualnews')

        # Проверяем код ответа
        self.assertEqual(response.status_code, 200)

        # Проверяем наличие элементов на странице
        self.assertIn('<h1>Actual News Page</h1>', response.text)
        self.assertIn('<h2>Comments:</h2>', response.text)
        self.assertIn('John', response.text)  # Проверяем наличие имени комментатора

if __name__ == '__main__':
    unittest.main()

