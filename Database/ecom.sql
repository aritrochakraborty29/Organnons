-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2020 at 03:43 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin'),
(2, 'admin2', 'admin2'),
(3, 'admin3', 'admin3');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categories`, `status`) VALUES
(2, 'Grocery', 1),
(3, 'Vegetables', 1),
(5, 'Beverages', 1),
(6, 'Fruits', 1),
(7, 'Dairy', 1),
(10, 'Cat6', 0);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(75) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `comment` text NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `mobile`, `comment`, `added_on`) VALUES
(1, 'Sudipta', 'sudipta@gmail.com', '1234567890', 'Test Query', '2020-01-14 00:00:00'),
(3, 'aritro', 'adr@gmail.com', '1235', 'test', '2020-10-31 04:47:28'),
(4, 'tapan', 'tapan@gmal.com', '4531321', 'test', '2020-11-12 02:37:50');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mrp` float NOT NULL,
  `price` float NOT NULL,
  `qty` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `short_desc` varchar(2000) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(2000) NOT NULL,
  `meta_desc` varchar(2000) NOT NULL,
  `meta_keyword` varchar(2000) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `categories_id`, `name`, `mrp`, `price`, `qty`, `image`, `short_desc`, `description`, `meta_title`, `meta_desc`, `meta_keyword`, `status`) VALUES
(2, 3, 'Tomato', 40, 30, 100, '621501609_toma.jpg', 'Tomato', 'Tomato is partly sweet and partly sour in taste. Tomatoes are very refreshing, rich in Vitamin C and are almost ubiquitous in any cuisine. Be it a base for curries, salads, pizzas, condiments and even breads, they make for a versatile ingredient. It is rich in multiple nutrients. They are known to be good sources of vitamin C and help in boosting your cardiovascular health. Tomatoes are laden with lycopene, which is a carotenoid known for preventing the risks of cancer.', 'testtest', '', 'test', 1),
(3, 3, 'Potato', 42, 37, 100, '239532939_potato.jpg', 'Jyoti', 'Potatoes are filling, reasonable in calories, non-fattening, and are nutrient dense, which means you obtain many nutrients for the amount of calories they have. It has a rich and smooth texture. It is a good supply of carbohydrates, dietary fiber and some minerals like potassium, copper, magnesium and iron. It is also rich in phytochemical antioxidants like flavonoids, other B vitamins as well as folate.', 'test', '', 'test', 1),
(7, 3, 'Cabbage Regular', 40, 30, 20, '729026806_bandhakopi.jpg', 'Badha Kopi', 'Cabbage has a round shape and is composed of superimposed leaf layers. There should be minimally a few outer loose leaves attached to the stem. If not, it may be an indication of disagreeable texture and savor. It is a brilliant supply of vitamin B6, C, K. The health benefits of cabbage include frequent use as a treatment for constipation, stomach ulcers, headaches, obesity, skin disorders, eczema, jaundice, scurvy, rheumatism, arthritis, gout, eye disorders, heart diseases, aging, and Alzheimer disease.', 'test', '', 'test', 1),
(11, 3, 'Cauliflower', 50, 35, 20, '467469704_fullkopi.jpg', 'Phul Kopi', 'Cauliflower is a versatile vegetable, which makes for a great side dish or main dish. A member of the cruciferous vegetable family, to which also belongs the more famous broccoli, cauliflower is loaded with anti-oxidants and phyto-nutrients. Cauliflower contains sulforaphane, a sulfur compound that has also been shown to kill cancer stem cells, thereby slowing tumor growth. They are an excellent source of natural antioxidants due to their high levels of various phytochemicals, as well as good suppliers of essential vitamins, carotenoids, fiber, soluble sugars, minerals, and phenolic compounds.', 'test', '', 'test', 1),
(16, 6, 'Watermelon', 70, 60, 23, '628484463_watermilon.jpg', 'Tarmuj', 'Watermelon is sugary, juicy with a grainy texture. It is wealthy in electrolytes & water. It brings more nutrients per calorie making it an outstanding health product. It is wealthy in photo nutrients including anti-oxidant flavonoids. It is an excellent source of potassium, manganese and it is an outstanding source of Vitamin A, includes a good amount of thiamin (vitamin B-1), vitamin-B6 (pyridoxine), and vitamin-C. Watermelon is extremely alkaline forming and reduces acidity, also it is a natural diuretic. They contain citrulline which can trigger production of a compound in the body that helps relax the body blood vessels, promoting cardiovascular health. It eases inflammation in conditions like asthma, atherosclerosis, diabetes, colon cancer, and arthritis.', '', '', '', 1),
(17, 6, 'Sweet Lime', 65, 50, 50, '541271204_lemo.jpg', 'Mousambi', 'testing', 'testing', '', 'testing', 1),
(18, 6, 'Banana', 50, 40, 50, '962442425_bana.jpg', 'Singapuri', 'Singapuri Bananas are around 6-7 inches long. Fresh fruits are green which revolve a bright yellow on ripening and the flesh contains a white- ceramic color. Robusta contains a distinct sweet flavor, good fragrance and the texture is mushy and soft. It includes trace amounts of many amino acids, including tryptophan. You can verify for ripeness of banana by trying to peel it, in developed bananas the stem near the top of the banana arrives off easily. It provides some iron, magnesium, calcium and phosphorus as well as vitamins A and E, folate, carotene and chlorine. One banana supplies 30 percent of the daily B6 requirement and is rich in Vitamin C and potassium.', '', '', '', 1),
(20, 6, 'Apple', 180, 150, 50, '221775418_apple.png', 'kashmiri-Apple', 'Kinnaur Apples from Kinnaur, known for their natural sweetness, colour, succulence and prolonged shelf life, are grown at an altitude of over 10,000 feet. Among the popular varieties of Kinnauri apples are Royal, Golden, Red Golden, Red Delicious and Scarlet Spur. Major apple belts in Kinnaur district are in Sangla and Pooh blocks which have been worst affected due to flash floods of Uttarakhand. The actual plucking season in Himachal Pradesh and Uttarakhand begins in July end and the crop hits the market in August.', '', '', '', 1),
(21, 3, 'Onion', 45, 40, 20, '813059314_onion.jpg', 'Onion', 'Onion is known for its pungent aroma and spicy taste. It is widely used in making gravies for vegetables and stews. It is one of the favourite ingredient in salads, it can be mixed and fried with gram flour to make delectable snacks and Pakodas too. Onion is rich in phytochemicals, vitamin C and anti-oxidants. It improves body immunity and helps in reducing cholesterol.', '', '', '', 1),
(22, 3, 'Brinjal - Bottle Shape', 0, 30, 25, '434754187_bringel.jpg', 'Begun', 'Brinjal is also called eggplant. They have a glossy skin and come in extensive range of sizes, shapes and colors. It is low in calories and very rich in dietary fiber and numerous phytonutrient compounds & antioxidants. The purple ones include high amounts of the compound anthocyanin. It is rich in B-complex vitamins and Minerals. It protect the body from health risks, like inflammation and neurological diseases. It is capable of improving the flexibility of blood vessels, resulting in improved blood circulation. It helps in keeping blood sugar under control, lowering cholesterol, improving the digestive system and assisting weight management.', '', '', '', 0),
(23, 2, 'Atta', 213, 200, 5, '650318671_ata.jpg', 'Aashirvaad', 'Aashirvaad Whole Wheat Atta has 0% maida and 100% atta. This means you serve soft, fluffy rotis and a whole lot of health and happiness.', '', '', '', 1),
(24, 2, 'Basmati Rice Dubar', 123, 110, 5, '799454464_rice.jpg', 'India Gate', 'India Gate Basmati rice Dubar being a rich and extraordinary mix of tradition and royalty optimizes the strength of an exclusive and amazing India. This rice is dissimilar from other rice mostly due to the fragrance and length post cooking. Its smelled, nutlike taste and smell can be recognized to the fact that the grain is aged, to shrink its moisture content. Per 100 g contain Calories: 344 kcal, Sodium: 0 mg, Total Fat: 1 g, Potassium: 0 mg, Saturated: 0 g, Total Carbs: 77 g, Polyunsaturated: 0 g, Dietary Fiber: 1 g, Monounsaturated: 0 g, Sugars: 0 g, Trans: 0 g, Protein: 7 g, Cholesterol: 0 mg.', '', '', '', 1),
(25, 2, 'Refine Oil', 135, 120, 10, '652822133_tel.jpg', 'Fortune Soyabean', 'Fortune Refined Soybean Oil is extracted from soybeans and is packed with healthy fats such as Omega-3 fatty acids. The neutral taste of the oil is perfect for bringing out the flavours of the spices and the vegetables. Fortune refined soybean oil is enriched with polyunsaturated fat which helps to lower bad cholesterol levels. The Omega-3 fatty acid present in the oil cannot be produced in our bodies naturally; so a healthy intake of these fatty acids will be really good for health. It helps to reduce inflammation, and reduces the risks of heart disease and arthritis.', '', '', '', 1),
(26, 2, 'Dal', 69, 50, 50, '663539377_dal.jpg', 'Moong', 'Moong beans is a popular food among vegetarians since it contains a lot of proteins and fiber. It is one of the easiest dals to digest and for this reason it is often given to people recovering from an illness, specially a stomach upset. It has antioxidants which is very healthy for the good functioning of the human body. It is a good balanced diet and could be included in our daily.', '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `mobile`, `added_on`) VALUES
(1, 'Sudipta Roy Chowdhury', 'admin', 'sudipta@gmail.com', '1234567890', '2020-01-14 00:00:00'),
(4, 'aritro', 'admin', 'asr@gmail.com', '12345', '2020-10-31 04:12:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
