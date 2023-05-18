% rebase('layout.tpl', title='Shop', year=year)

<div class="custom-row">
      <div class="custom-col-75">
        <div class="custom-container">
                  <div class="custom-row">
          <div class="custom-col-50">
            <h3>Платеж</h3>
            <form action="/orders" method="post">
            <label for="fname"><i class="fa fa-user"></i>Ваше ФИО, на английском!</label>
            <input type="text" id="fname" name="firstname" placeholder="Rykhlov Kirill Igorevich" required>
            <label for="email"><i class="fa fa-envelope"></i> Email</label>
            <input type="text" id="email" name="email" placeholder="rihlov.kirill@mail.ru" required>
          </div>
          <div class="custom-col-50">
            <label style="margin-top:50px;" for="ccnum">Номер кредитной карты</label>
            <input type="text" id="ccnum" name="cardnumber" placeholder="1111222233334444" required>
            <label for="ccnum">Номер телефона</label>
            <input type="text" id="ccnum" name="phone" placeholder="+78005553535" required>
          </div>
        </div>
        <p style="font-size: 13pt">{{ msg }}</p>
        <input class="popup__neworder" type="submit" value="Оплатить">
        </form>
    </div>
  </div>
</div>
