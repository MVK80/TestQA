#language: ru

@tree
@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Заполнение шапки документа Заказ 

Сценарий: я заполняю шапку документа Заказ
И из выпадающего списка с именем "Организация" я выбираю по строке 'ООО "1000 мелочей"'
И я нажимаю кнопку выбора у поля с именем "Покупатель"
Тогда открылось окно 'Контрагенты'
И в таблице "Список" я перехожу к строке:
	| 'Код'       | 'Наименование' |
	| '000000010' | 'Корнет ЗАО'   |
И в таблице "Список" я выбираю текущую строку
Тогда открылось окно 'Заказ (создание) *'
И из выпадающего списка с именем "Склад" я выбираю по строке 'Большой'
