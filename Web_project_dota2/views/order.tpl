% rebase('layout.tpl', title='Order', year=year)

<div class="row">
  <div class="col-75">
    <div class="container">
      <form action="/action_page.php">

        <div class="row">
          <div class="col-50">
            <h3>��������� �����</h3>
            <label for="fname"><i class="fa fa-user"></i>���</label>
            <input type="text" id="fname" name="firstname" placeholder="������� ������ ����������">
            <label for="email"><i class="fa fa-envelope"></i> Email</label>
            <input type="text" id="email" name="email" placeholder="and-shhipunov@mail.ru">
            <label for="adr"><i class="fa fa-address-card-o"></i>�����</label>
            <input type="text" id="adr" name="address" placeholder="������� 44-39">
            <label for="city"><i class="fa fa-institution"></i>�����</label>
            <input type="text" id="city" name="city" placeholder="�����">

            <div class="row">
              <div class="col-50">
                <label for="state">�����������</label>
                <input type="text" id="state" name="state" placeholder="������">
              </div>
              <div class="col-50">
                <label for="zip">Zip</label>
                <input type="text" id="zip" name="zip" placeholder="10001">
              </div>
            </div>
          </div>

          <div class="col-50">
            <h3>������</h3>
            <label for="fname">���������� �����</label>
            <div class="icon-container">
              <i class="fa fa-cc-visa" style="color:navy;"></i>
              <i class="fa fa-cc-amex" style="color:blue;"></i>
              <i class="fa fa-cc-mastercard" style="color:red;"></i>
              <i class="fa fa-cc-discover" style="color:orange;"></i>
            </div>
            <label for="cname">��� �� �����</label>
            <input type="text" id="cname" name="cardname" placeholder="������� ������ ����������">
            <label for="ccnum">����� ��������� �����</label>
            <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
            <label for="expmonth">����� �����</label>
            <input type="text" id="expmonth" name="expmonth" placeholder="��������">

            <div class="row">
              <div class="col-50">
                <label for="expyear">����� ���</label>
                <input type="text" id="expyear" name="expyear" placeholder="2021">
              </div>
              <div class="col-50">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="352">
              </div>
            </div>
          </div>

        </div>
        <label>
          <input type="checkbox" checked="checked" name="sameadr"> ����� ������� ��������� � ��������� �������
        </label>
        <input type="submit" value="���������� ���������� ������" class="btn">
      </form>
    </div>
  </div>

  <div class="col-25">
    <div class="container">
      <h4>�������
        <span class="price" style="color:black">
          <i class="fa fa-shopping-cart"></i>
          <b>4</b>
        </span>
      </h4>
      <p><a href="#">������� 1</a> <span class="price">$15</span></p>
      <p><a href="#">������� 2</a> <span class="price">$5</span></p>
      <p><a href="#">������� 3</a> <span class="price">$8</span></p>
      <p><a href="#">������� 4</a> <span class="price">$2</span></p>
      <hr>
      <p>����� <span class="price" style="color:black"><b>$30</b></span></p>
    </div>
  </div>
</div>