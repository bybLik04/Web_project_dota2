"""
Routes and views for the bottle application.
"""

from bottle import route, view
from datetime import datetime

@route('/')
@route('/home')
@view('index')
def home():
    """Renders the home page."""
    return dict(
        year=datetime.now().year
    )

@route('/contact')
@view('contact')
def contact():
    """Renders the contact page."""
    return dict(
        title='Contact',
        message='Your contact page.',
        year=datetime.now().year
    )

@route('/about')
@view('about')
def about():
    """Renders the about page."""
    return dict(
        title='About',
        message='Your application description page.',
        year=datetime.now().year
    )

@route('/weapon')
@view('weapon')
def weapon():
    return dict(
        year=datetime.now().year
    )

@route('/armor')
@view('armor')
def armor():
    return dict(
        year=datetime.now().year
    )

@route('/magic')
@view('magic')
def magic():
    return dict(
        year=datetime.now().year
    )

@route('/shop')
@view('shop')
def shop():
    return dict(
        title='Shop',
        year=datetime.now().year
    )

@route('/orders')
@view('orders')
def order():
    return dict(
        title='Orders',
        year=datetime.now().year
    )