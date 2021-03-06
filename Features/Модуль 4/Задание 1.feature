#language: ru

@tree

Функционал: Проверка заполнения полей шапки документа Заказа покупателя

Как Менеджер по продажам я хочу
убедится в правильности заполнения полей шапки Заказа покупателя
чтобы информация в системе соответствовала заложенной логике. 

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Проверка заполнения полей шапки документа Заказа покупателя
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
	И я нажимаю на кнопку с именем 'FormCreate'
	* Проверка недоступности контрагента при не заполненном партнере
		Когда Проверяю шаги на Исключение:
			|'И в поле с именем "Контрагент" я ввожу текст "ТекстПоля"'|
	* Проверка заполнения соглашения при выборе партнера
		И я нажимаю кнопку выбора у поля с именем "Partner"
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'         |
			| '10'  | 'Розничный покупатель' |
		И в таблице "List" я выбираю текущую строку
		Тогда элемент формы с именем "Agreement" стал равен 'Розничное'
		И я нажимаю кнопку выбора у поля с именем "Partner"
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'            |
			| '1'   | 'Клиент 1 (1 соглашение)' |
		И в таблице "List" я выбираю текущую строку
		Тогда элемент формы с именем "Agreement" стал равен 'Соглашение с клиентами (расчет по документам + кредитный лимит)'
	* Проверка очистки поля соглашение при очистке партнера
		* Очистка удалением строки
			И в поле с именем 'Partner' я ввожу текст ''
			Тогда элемент формы с именем "Agreement" стал равен ''
		* Очистка через нажатие кнопки очистить
			И я нажимаю кнопку выбора у поля с именем "Partner"
			И в таблице "List" я перехожу к строке:
				| 'Код' | 'Наименование'            |
				| '1'   | 'Клиент 1 (1 соглашение)' |
			И в таблице "List" я выбираю текущую строку
			Тогда открылось окно 'Табличная часть товаров будет обновлена'
			И я нажимаю на кнопку с именем 'FormOK'
			И я нажимаю кнопку очистить у поля с именем "Partner"
			Тогда элемент формы с именем "Partner" стал равен ''
			Тогда элемент формы с именем "Agreement" стал равен ''
		* Очистка нажатием "горячей" клавиши	
			И я нажимаю кнопку выбора у поля с именем "Partner"
			И в таблице "List" я перехожу к строке:
				| 'Код' | 'Наименование'            |
				| '1'   | 'Клиент 1 (1 соглашение)' |
			И в таблице "List" я выбираю текущую строку
			Тогда открылось окно 'Табличная часть товаров будет обновлена'
			И я нажимаю на кнопку с именем 'FormOK'
			И я нажимаю сочетание клавиш "Shift+F4"
			Тогда элемент формы с именем "Partner" стал равен ''
			Тогда элемент формы с именем "Agreement" стал равен ''		
	* Проверка заполнения партнера при пустом партнере и выборе соглашения
		И я нажимаю кнопку выбора у поля с именем "Agreement"
		И в таблице "List" я перехожу к строке:
			| 'Вид'     | 'Вид взаиморасчетов'         | 'Код' | 'Наименование'                                         |
			| 'Обычное' | 'По стандартным соглашениям' | '5'   | 'Общее соглашение (расчет по стандартным соглашениям)' |
		И в таблице "List" я выбираю текущую строку
		Тогда открылось окно 'Табличная часть товаров будет обновлена'
		И я нажимаю на кнопку с именем 'FormOK'
		Тогда элемент формы с именем "Partner" стал равен ''
	И я закрываю все окна клиентского приложения
			

				
										