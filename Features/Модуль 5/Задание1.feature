#language: ru

@tree

Функционал: создание большого объема данных (справочник Номенклатура)

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий
		
Сценарий: создание большого объема данных (справочник Номенклатура)
	// Справочник.ItemTypes
	И я проверяю или создаю для справочника "ItemTypes" объекты:
		| 'Ref'                                                               | 'DeletionMark' | 'Parent' | 'IsFolder' | 'Code' | 'Type'                   | 'UseSerialLotNumber' | 'Description_en'            | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'UniqueID'                          |
		| 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f6879' | 'False'        | ''       | 'False'    | 2      | 'Enum.ItemTypes.Product' | 'False'              | 'Товар (без характеристик)' | ''                 | ''               | ''               | '_32c63d8e5ee94926b3c772ab02c5243e' |
	// Справочник.Units
	И я проверяю или создаю для справочника "Units" объекты:
		| 'Ref'                                                           | 'DeletionMark' | 'Code' | 'Item' | 'Quantity' | 'BasisUnit' | 'UOM' | 'Description_en' | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
		| 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 'False'        | 1      | ''     | 1          | ''          | ''    | 'шт'             | ''                 | ''               | ''               |          |          |          |          |         |
	И Я запоминаю значение выражения '1' в переменную "Шаг"
	И я делаю 10 раз
		И я запоминаю значение выражения '$Шаг$ + 1' в переменную "Шаг"
		И Я запоминаю значение выражения '"Товар" + $Шаг$' в переменную "Товар"
		И я проверяю или создаю для справочника "Items" объекты:
			| 'Ref'                                                                                       | 'DeletionMark' | 'Code' | 'ItemType'                                                          | 'Unit'                                                          | 'Description_en' |
			| '{"e1cib/data/Catalog.Items?ref=" + СтрЗаменить(Новый УникальныйИдентификатор(), "-", "")}' | 'False'        |        | 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f6879' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | '$Товар$'        |

