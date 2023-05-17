// Утилиты

// Функция toNum преобразует строку в число, удаляя пробелы.
function toNum(str) {
    const num = Number(str.replace(/ /g, ""));
    return num;
}

// Функция toCurrency форматирует число как валюту в российском формате.
function toCurrency(num) {
    const format = new Intl.NumberFormat("ru-RU", {
        style: "currency",
        currency: "RUB",
        minimumFractionDigits: 0,
    }).format(num);
    return format;
}

// Корзина

// Получаем элементы страницы
const cardAddArr = Array.from(document.querySelectorAll(".card__add"));
const cartNum = document.querySelector("#cart_num");
const cart = document.querySelector("#cart");

// Класс Cart представляет корзину товаров
class Cart {
    products; // Массив товаров
    constructor() {
        this.products = [];
    }
    // Геттер для получения количества товаров в корзине
    get count() {
        return this.products.length;
    }
    // Метод добавления товара в корзину
    addProduct(product) {
        this.products.push(product);
    }
    // Метод удаления товара из корзины по индексу
    removeProduct(index) {
        this.products.splice(index, 1);
    }
    // Геттер для получения общей стоимости товаров в корзине
    get cost() {
        const prices = this.products.map((product) => {
            return toNum(product.price);
        });
        const sum = prices.reduce((acc, num) => {
            return acc + num;
        }, 0);
        return sum;
    }
    // Геттер для получения общей стоимости товаров со скидкой
    get costDiscount() {
        const prices = this.products.map((product) => {
            return toNum(product.priceDiscount);
        });
        const sum = prices.reduce((acc, num) => {
            return acc + num;
        }, 0);
        return sum;
    }
    // Геттер для получения суммарной скидки на товары в корзине
    get discount() {
        return this.cost - this.costDiscount;
    }
}

// Класс Product представляет товар
class Product {
    imageSrc;
    name;
    price;
    priceDiscount;
    constructor(card) {
        // Инициализируем свойства товара на основе элемента карточки товара
        this.imageSrc = card.querySelector(".card__image").children[0].src;
        this.name = card.querySelector(".card__title").innerText;
        this.price = card.querySelector(".card__price--common").innerText;
        this.priceDiscount = card.querySelector(".card__price--discount").innerText;
    }
}

// Создаем экземпляр корзины
const myCart = new Cart();

// Если в localStorage нет сохраненной корзины, сохраняем текущую корзину в localStorage
if (localStorage.getItem("cart") == null) {
    localStorage.setItem("cart", JSON.stringify(myCart));
}

// Получаем сохраненную корзину из localStorage и присваиваем ее экземпляру myCart
const savedCart = JSON.parse(localStorage.getItem("cart"));
myCart.products = savedCart.products;

// Обновляем отображение количества товаров в корзине на странице
cartNum.textContent = myCart.count;

// Добавляем обработчики событий на кнопки "Добавить в корзину" для каждой карточки товара
myCart.products = cardAddArr.forEach((cardAdd) => {
    cardAdd.addEventListener("click", (e) => {
        e.preventDefault();
        const card = e.target.closest(".card");
        const product = new Product(card);
        const savedCart = JSON.parse(localStorage.getItem("cart"));
        myCart.products = savedCart.products;
        myCart.addProduct(product);
        localStorage.setItem("cart", JSON.stringify(myCart));
        cartNum.textContent = myCart.count;
    });
});

// Попап

// Получаем элементы попапа
const popup = document.querySelector(".popup");
const popupClose = document.querySelector("#popup_close");
const body = document.body;
const popupContainer = document.querySelector("#popup_container");
const popupProductList = document.querySelector("#popup_product_list");
const popupCost = document.querySelector("#popup_cost");
const popupDiscount = document.querySelector("#popup_discount");
const popupCostDiscount = document.querySelector("#popup_cost_discount");

// Добавляем обработчик события на кнопку "Корзина"
cart.addEventListener("click", (e) => {
    e.preventDefault();
    popup.classList.add("popup--open");
    body.classList.add("lock");
    popupContainerFill();
});

// Функция для заполнения контейнера попапа данными из корзины
function popupContainerFill() {
    popupProductList.innerHTML = null;
    const savedCart = JSON.parse(localStorage.getItem("cart"));
    myCart.products = savedCart.products;
    const productsHTML = myCart.products.map((product) => {
        const productItem = document.createElement("div");
        productItem.classList.add("popup__product");
        const productWrap1 = document.createElement("div");
        productWrap1.classList.add("popup__product-wrap");
        const productWrap2 = document.createElement("div");
        productWrap2.classList.add("popup__product-wrap");

        const productImage = document.createElement("img");
        productImage.classList.add("popup__product-image");
        productImage.setAttribute("src", product.imageSrc);

        const productTitle = document.createElement("h2");
        productTitle.classList.add("popup__product-title");
        productTitle.innerHTML = product.name;

        const productPrice = document.createElement("div");
        productPrice.classList.add("popup__product-price");
        productPrice.innerHTML = toCurrency(toNum(product.priceDiscount));

        const productDelete = document.createElement("button");
        productDelete.classList.add("popup__product-delete");
        productDelete.innerHTML = "&#10006;";

        // Добавляем обработчик события на кнопку удаления товара из корзины
        productDelete.addEventListener("click", () => {
            myCart.removeProduct(product);
            localStorage.setItem("cart", JSON.stringify(myCart));
            popupContainerFill();
        });

        productWrap1.appendChild(productImage);
        productWrap1.appendChild(productTitle);
        productWrap2.appendChild(productPrice);
        productWrap2.appendChild(productDelete);
        productItem.appendChild(productWrap1);
        productItem.appendChild(productWrap2);

        return productItem;
    });

    productsHTML.forEach((productHTML) => {
        popupProductList.appendChild(productHTML);
    });

    popupCost.value = toCurrency(myCart.cost);
    popupDiscount.value = toCurrency(myCart.discount);
    popupCostDiscount.value = toCurrency(myCart.costDiscount);
}

// Добавляем обработчик события на кнопку закрытия попапа
popupClose.addEventListener("click", (e) => {
    e.preventDefault();
    popup.classList.remove("popup--open");
    body.classList.remove("lock");
});