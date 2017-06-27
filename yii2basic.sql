-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 27 2017 г., 09:40
-- Версия сервера: 5.5.53
-- Версия PHP: 5.6.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `yii2basic`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`, `parent_id`, `keywords`, `description`) VALUES
(1, 'Sportswear', NULL, NULL, NULL),
(2, 'Mens', NULL, NULL, NULL),
(3, 'Womens', NULL, NULL, NULL),
(4, 'Nike', 1, NULL, NULL),
(5, 'Under amour', 1, NULL, NULL),
(6, 'Adidas', 1, NULL, NULL),
(7, 'Puma', 1, NULL, NULL),
(8, 'ASICS', 1, NULL, NULL),
(9, 'Fendi', 2, NULL, NULL),
(10, 'Guess', 2, NULL, NULL),
(11, 'Valentino', 2, NULL, NULL),
(12, 'Dior', 2, NULL, NULL),
(13, 'Versace', 2, NULL, NULL),
(14, 'Armani', 2, NULL, NULL),
(15, 'Prado', 2, NULL, NULL),
(16, 'Dolce & Gabana', 2, NULL, NULL),
(17, 'Chanel', 2, NULL, NULL),
(18, 'Gucci', 2, NULL, NULL),
(19, 'Fendi', 3, NULL, NULL),
(20, 'Guess', 3, NULL, NULL),
(21, 'Valentino', 3, NULL, NULL),
(22, 'Dior', 3, NULL, NULL),
(23, 'Versace', 3, NULL, NULL),
(24, 'Kids', NULL, NULL, NULL),
(25, 'Fashion', NULL, NULL, NULL),
(26, 'Hauseholds', NULL, NULL, NULL),
(27, 'Interiors', NULL, NULL, NULL),
(28, 'Clothing', NULL, NULL, NULL),
(29, 'Bags', NULL, 'Сумки', 'Сумки'),
(30, 'Shoes', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `filePath` varchar(400) NOT NULL,
  `itemId` int(11) DEFAULT NULL,
  `isMain` tinyint(1) DEFAULT NULL,
  `modelName` varchar(150) NOT NULL,
  `urlAlias` varchar(400) NOT NULL,
  `name` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `image`
--

INSERT INTO `image` (`id`, `filePath`, `itemId`, `isMain`, `modelName`, `urlAlias`, `name`) VALUES
(26, 'Products/Product1/09886f.jpg', 1, 1, 'Product', '38c6b04539-1', ''),
(27, 'Products/Product1/e19a9f.jpg', 1, NULL, 'Product', '751e48b7eb-2', ''),
(28, 'Products/Product1/b1595e.jpg', 1, NULL, 'Product', 'ebb9a02478-3', ''),
(29, 'Products/Product1/315db1.jpg', 1, NULL, 'Product', 'bae3dee517-4', '');

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1487164668),
('m140622_111540_create_image_table', 1487519684),
('m140622_111545_add_name_to_image_table', 1487519685),
('m160324_092359_create_category_table', 1487164675),
('m160324_092413_create_product_table', 1487164675),
('m160324_092467_create_order_table', 1487334976),
('m160324_092577_create_order_item_table', 1487334976);

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `qty` int(11) NOT NULL,
  `sum` int(11) NOT NULL,
  `status` smallint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `adress` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`id`, `create_at`, `update_at`, `qty`, `sum`, `status`, `name`, `email`, `phone`, `adress`) VALUES
(2, '2017-02-17 16:48:08', '2017-02-17 16:48:08', 4, 23702, 0, 'Таня', 'tanyain@rambler.ru', '0687461804', 'ул. Калинина 70'),
(3, '2017-02-17 16:53:21', '2017-02-17 16:53:21', 3, 37094, 0, 'Таня', 'test@test.ua', '0687461804', 'ул. Калинина 70'),
(4, '2017-02-17 17:25:12', '2017-02-17 17:25:12', 3, 8057, 0, 'Таня', 'ischenkovm@rambler.ru', '0687461804', 'ул. Калинина 70'),
(5, '2017-02-17 17:25:48', '2017-02-17 17:25:48', 3, 8057, 0, 'Таня', 'ischenkovm@rambler.ru', '0687461804', 'ул. Калинина 70'),
(6, '2017-02-17 17:33:19', '2017-02-17 17:33:19', 2, 34773, 0, 'Таня', 'ischenkovm@rambler.ru', '0687461804', 'ул. Калинина 70'),
(7, '2017-02-17 17:41:24', '2017-02-17 17:41:24', 4, 21494, 0, 'Таня', 'ischenkovm@rambler.ru', '0687461805', 'ул. Бидгощська 38/1');

-- --------------------------------------------------------

--
-- Структура таблицы `order_item`
--

CREATE TABLE `order_item` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `qty_item` int(11) DEFAULT NULL,
  `sum_item` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order_item`
--

INSERT INTO `order_item` (`id`, `product_id`, `order_id`, `name`, `price`, `qty_item`, `sum_item`) VALUES
(1, 4, 2, 'Блузка и рубашка', 4532, 2, 9064),
(2, 5, 2, 'Блузка и рубашка', 2324, 1, 2324),
(3, 6, 2, 'Блузки CRISSCROSS', 12314, 1, 12314),
(4, 1, 3, 'Женский плащ В-868', 2321, 2, 4642),
(5, 2, 3, 'Женский плащ В-868', 32452, 1, 32452),
(6, 1, 4, 'Женский плащ В-868', 2321, 2, 4642),
(7, 3, 4, 'Монокини А-353', 3415, 1, 3415),
(8, 1, 5, 'Женский плащ В-868', 2321, 2, 4642),
(9, 3, 5, 'Монокини А-353', 3415, 1, 3415),
(10, 1, 6, 'Женский плащ В-868', 2321, 1, 2321),
(11, 2, 6, 'Женский плащ В-868', 32452, 1, 32452),
(12, 4, 7, 'Блузка и рубашка', 4532, 1, 4532),
(13, 5, 7, 'Блузка и рубашка', 2324, 2, 4648),
(14, 6, 7, 'Блузки CRISSCROSS', 12314, 1, 12314);

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `content` text,
  `price` int(11) NOT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT 'no-image.png',
  `hit` smallint(1) NOT NULL DEFAULT '0',
  `new` smallint(1) NOT NULL DEFAULT '0',
  `sale` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `content`, `price`, `keywords`, `description`, `img`, `hit`, `new`, `sale`) VALUES
(1, 1, 'Женский плащ В-868', '<p><img alt=\"\" src=\"/web/upload/global/similar1.jpg\" style=\"float:left; height:119px; margin:5px; width:120px\" />Нарядное платье Зарина полуприталенного силуэта, прямого покроя с длинным рукавом. Изделие выполнено из высококачественного трикотажа-лакоста. За счёт перфорации, которая украшает рукава, переднюю часть и юбку, платье выглядит очень женственно и празднично. Любой мужчина будет в полном восторге, видя даму своего сердца в таком образе! Материал: хлопок 75%, эластан 25% Пол: женщинам Комплектация: платье</p>\r\n\r\n<h2>Зоголовок 2 уровня</h2>\r\n\r\n<p><strong>Нарядное платье Зарина</strong> полуприталенного силуэта, прямого покроя с длинным рукавом. Изделие выполнено из высококачественного трикотажа-лакоста. За счёт перфорации, которая украшает рукава, переднюю часть и юбку, платье выглядит очень женственно и празднично. Любой мужчина будет в полном восторге, видя даму своего сердца в таком образе! Материал: хлопок 75%, эластан 25% Пол: женщинам Комплектация: платье</p>\r\n', 2321, 'gfgs', 'Нарядное платье Зарина полуприталенного силуэта, прямого покроя с длинным рукавом. Изделие выполнено из высококачественного трикотажа-лакоста', 'product1.jpg', 1, 0, 1),
(2, 1, 'Женский плащ В-868', '<p>Нарядное платье Зарина полуприталенного силуэта, прямого покроя с длинным рукавом. Изделие выполнено из высококачественного трикотажа-лакоста. За счёт перфорации, которая украшает рукава, переднюю часть и юбку, платье выглядит очень женственно и празднично. Любой мужчина будет в полном восторге, видя даму своего сердца в таком образе! Материал: хлопок 75%, эластан 25% Пол: женщинам Комплектация: платье</p>\r\n', 32452, 'dsafgs', 'Нарядное платье Зарина полуприталенного силуэта, прямого покроя с длинным рукавом. Изделие выполнено из высококачественного трикотажа-лакоста. ', 'product3.jpg', 1, 1, 0),
(3, 1, 'Монокини А-353', 'Нарядное платье Зарина полуприталенного силуэта, прямого покроя с длинным рукавом. Изделие выполнено из высококачественного трикотажа-лакоста. За счёт перфорации, которая украшает рукава, переднюю часть и юбку, платье выглядит очень женственно и празднично. Любой мужчина будет в полном восторге, видя даму своего сердца в таком образе! \r\nМатериал: хлопок 75%, эластан 25%', 3415, 'dfsgd', 'Нарядное платье Зарина полуприталенного силуэта, прямого покроя с длинным рукавом. Изделие выполнено из высококачественного трикотажа-лакоста.', 'product3.jpg', 1, 0, 1),
(4, 1, 'Блузка и рубашка', 'Нарядное платье Зарина полуприталенного силуэта, прямого покроя с длинным рукавом. Изделие выполнено из высококачественного трикотажа-лакоста. За счёт перфорации, которая украшает рукава, переднюю часть и юбку, платье выглядит очень женственно и празднично. Любой мужчина будет в полном восторге, видя даму своего сердца в таком образе! Материал: хлопок 75%, эластан 25%\r\nПол: женщинам', 4532, 'dfags', 'Нарядное платье Зарина полуприталенного силуэта, прямого покроя с длинным рукавом. Изделие выполнено из высококачественного трикотажа-лакоста', 'product4.jpg', 1, 1, 0),
(5, 2, 'Блузка и рубашка', 'Нарядное платье Зарина полуприталенного силуэта, прямого покроя с длинным рукавом. Изделие выполнено из высококачественного трикотажа-лакоста. За счёт перфорации, которая украшает рукава, переднюю часть и юбку, платье выглядит очень женственно и празднично. Любой мужчина будет в полном восторге, видя даму своего сердца в таком образе! Материал: хлопок 75%, эластан 25%\r\nПол: женщинам', 2324, '43', 'Нарядное платье Зарина полуприталенного силуэта, прямого покроя с длинным рукавом. Изделие выполнено из высококачественного трикотажа-лакоста', 'product5.jpg', 1, 0, 1),
(6, 2, 'Блузки CRISSCROSS', 'Нарядное платье Зарина полуприталенного силуэта, прямого покроя с длинным рукавом. Изделие выполнено из высококачественного трикотажа-лакоста. За счёт перфорации, которая украшает рукава, переднюю часть и юбку, платье выглядит очень женственно и празднично. Любой мужчина будет в полном восторге, видя даму своего сердца в таком образе! \r\nМатериал: хлопок 75%, эластан 25%\r\nПол: женщинам', 12314, '425', 'Нарядное платье Зарина полуприталенного силуэта, прямого покроя с длинным рукавом. Изделие выполнено из высококачественного трикотажа-лакоста.', 'product6.jpg', 1, 1, 0),
(7, 1, 'Платья Ribbed Knit good', 'Нарядное платье Зарина полуприталенного силуэта, прямого покроя с длинным рукавом. Изделие выполнено из высококачественного трикотажа-лакоста. За счёт перфорации, которая украшает рукава, переднюю часть и юбку, платье выглядит очень женственно и празднично. Любой мужчина будет в полном восторге, видя даму своего сердца в таком образе! \r\nМатериал: хлопок 75%, эластан 25%', 1231, '4235', 'Нарядное платье Зарина полуприталенного силуэта, прямого покроя с длинным рукавом. Изделие выполнено из высококачественного трикотажа-лакоста', 'product3.jpg', 1, 0, 1),
(8, 6, 'Платья Ribbed Knit good', 'Нарядное платье Зарина полуприталенного силуэта, прямого покроя с длинным рукавом. Изделие выполнено из высококачественного трикотажа-лакоста. За счёт перфорации, которая украшает рукава, переднюю часть и юбку, платье выглядит очень женственно и празднично. Любой мужчина будет в полном восторге, видя даму своего сердца в таком образе! \r\nМатериал: хлопок 75%, эластан 25%', 3425, '234', 'Нарядное платье Зарина полуприталенного силуэта, прямого покроя с длинным рукавом. Изделие выполнено из высококачественного трикотажа-лакоста.', 'no-image.png', 1, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `auth_key` varchar(244) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `auth_key`) VALUES
(1, 'vitaliy', '$2y$13$xdw5iLUz/YkmtHR9cxi0BuOaqB.yGLXfV0hDDTI8DrK4PfOXAxj9m', 'JDv8FAQRu2KM_u4g21ddKCLZ5DwPrFha');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-category-parent_id` (`parent_id`);

--
-- Индексы таблицы `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk-order_item-order_id-order-id` (`order_id`),
  ADD KEY `fk-order_item-product_id-product-id` (`product_id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-product-category_id` (`category_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT для таблицы `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `fk-category-parent` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `fk-order_item-order_id-order-id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-order_item-product_id-product-id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk-product-category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
