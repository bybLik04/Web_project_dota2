import unittest
from bottle import Bottle, template
from webtest import TestApp

class ActualNewsTest(unittest.TestCase):
    def setUp(self):
        # ������� ��������� ���������� Bottle
        self.app = Bottle()

        # �������� ��� �������� actualnews
        @self.app.route('/actualnews')
        def actualnews():
            comments = [{'nickname': 'John', 'comment': 'Test comment'}]  # ������ �����������
            return template('actualnews', comments=comments)

    def test_actualnews_page(self):
        # ������� ��������� ��������� ���������� � �������������� ������ webtest
        test_app = TestApp(self.app)

        # ��������� GET-������ � �������� actualnews
        response = test_app.get('/actualnews')

        # ��������� ��� ������
        self.assertEqual(response.status_code, 200)

        # ��������� ������� ��������� �� ��������
        self.assertIn('<h1>Actual News Page</h1>', response.text)
        self.assertIn('<h2>Comments:</h2>', response.text)
        self.assertIn('John', response.text)  # ��������� ������� ����� ������������

if __name__ == '__main__':
    unittest.main()

