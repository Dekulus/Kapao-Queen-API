-- STRUCTURE

DROP DATABASE IF EXISTS kapao_queen;
CREATE DATABASE IF NOT EXISTS `kapao_queen` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE `kapao_queen`;

DROP TABLE IF EXISTS foodlist;
CREATE TABLE `foodlist` (
  `id` int PRIMARY KEY NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL, 
  `thai_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `search_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,

  `browse_description` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL, 
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` smallint(8)  DEFAULT NULL,

  `taglist` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `img` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `background` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,

  -- `ingredient_1` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL, -- url to img
  -- `ingredient_2` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  -- `ingredient_3` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  
  `type` varchar(12)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS users;
CREATE TABLE `kapao_queen`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `is_admin` TINYINT NOT NULL DEFAULT 0,
  `fname` VARCHAR(50),
  `lname` VARCHAR(50),
  `email` VARCHAR(50),
  `address` VARCHAR(100),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE);

DROP TABLE IF EXISTS ingredients;
CREATE TABLE `kapao_queen`.`ingredients` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `img` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE);

DROP TABLE IF EXISTS food_ingredients;
CREATE TABLE `kapao_queen`.`food_ingredients` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `food_id` INT NOT NULL,
  `ingredient_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `food_id_UNIQUE` (`food_id` ASC, `ingredient_id` ASC) VISIBLE,
  INDEX `fk_food_ingredients_ingredients1_idx` (`ingredient_id` ASC) VISIBLE,
  CONSTRAINT `fk_food_ingredients_ingredients1`
    FOREIGN KEY (`ingredient_id`)
    REFERENCES `kapao_queen`.`ingredients` (`id`),
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
  CONSTRAINT `fk_food_ingredients_food1`
    FOREIGN KEY (`food_id`)
    REFERENCES `kapao_queen`.`foodlist` (`id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION);
);

INSERT INTO `ingredients` (`id`,`name`, `img`) VALUES 
(1,'Chicken', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Ayam_kampung_free_range_chicken_meat_Indonesia.JPG/800px-Ayam_kampung_free_range_chicken_meat_Indonesia.JPG'),
(2,'Kaphrao', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Ocimum_tenuiflorum_24_08_2012.JPG/800px-Ocimum_tenuiflorum_24_08_2012.JPG'),
(3,'Pork','https://pngimg.com/d/pork_PNG32.png')
;

INSERT INTO `foodlist` (`id`,`name`,`thai_name`,`search_name`,`browse_description`,`description`,`type`,`price`,`taglist`,`img`,`background`) VALUES 
(
1,'Phat Kaphrao From God','ผัดกะเพราจากพระเจ้า','pad kra pao','Thai favourite stir fry',
'Phat Kaphrao Mu Sap is a traditional Thai dish that boasts a perfect balance of spicy, savory, and aromatic flavors.
his delicious stir-fried minced pork dish is cooked with plenty of fresh chili peppers, garlic, and Thai basil leaves, which gives it a distinct and irresistible taste. The tender and juicy pork is minced and cooked until it is lightly browned, and then combined with the spicy and fragrant mixture of herbs and spices.
The dish is served hot over a bed of steamed rice and topped with a fried egg, making it a complete and satisfying meal.',
'Main Courses',
80,
'Thai,Spicy',
'https://hot-thai-kitchen.com/wp-content/uploads/2022/10/pad-gaprao-beef-sq-2.jpg',
'https://img2.kochrezepte.at/use/19/pad-krapao-schweinefleisch-mit-thai-basilikum_19694.jpg'
);

INSERT INTO `food_ingredients` (`food_id`, `ingredient_id`) VALUES 
(1, 3),
(1, 2);


INSERT INTO `foodlist` (`id`,`name`, `thai_name`,`search_name`,`browse_description`,`description`,`type`,`price`,`taglist`,`img`,`background`) VALUES 
(
'2', 'Nutty Himaphan Cake', 'เค้กหิมพานต์', 'Himaphan Cake', 'Nutty, smooth Himaphan Cake.'
 'As you take your first bite, you are immediately hit with the sweetness of the cake, followed by a subtle nuttiness that comes from the acorn flour used in the batter. 
 The texture is dense and moist, with a slight crumb that adds to the overall rustic feel of the cake. 
 As you continue to eat, you notice a variety of different flavors and textures that are all perfectly balanced. 
 The wild blueberries that are scattered throughout the cake add a burst of tartness, while the chopped hazelnuts give it a satisfying crunch.',
 'dessert',
 150,
'Thai, Sweet, Dessert, Cake',
'https://cdn.pixabay.com/photo/2016/10/13/05/53/pecan-1736875_960_720.jpg',
'https://cdn.pixabay.com/photo/2016/10/13/05/53/pecan-1736875_960_720.jpg', 
 ),
 (
 '3', 'Fresh Lanna tea', 'ชาล้านนา', 'Lanna tea', 'Tea taken deep within lanna jungle', 
 'Lanna Tea is a soothing and comforting beverage that is both delicious and healthful. 
 As you take your first sip, you re immediately struck by the warm, earthy aroma of the tea, which is infused with the sweet and spicy flavor of holy basil.
 The tea itself is a rich, amber color, with a slight cloudiness that hints at its natural origins. As you take another sip, you feel the warmth of the tea spreading throughout your body, soothing your nerves and calming your mind.
 The flavor of the tea is complex and layered, with notes of cinnamon, cloves, and nutmeg dancing across your tongue. The holy basil adds a sweet and spicy flavor that lingers on your palate, leaving you with a feeling of peace and tranquility.',
'dessert',
   120,
'Drink, Tea, Dessert, Healthy',
'https://cdn.pixabay.com/photo/2017/03/01/05/12/tea-cup-2107599_960_720.jpg',
'https://cdn.pixabay.com/photo/2017/03/01/05/12/tea-cup-2107599_960_720.jpg',
),
(
'4', 'Premium Rice Mango','ข้าวเหนียวมะม่วง','Rice Mango','The perfect dessert to end any Thai feast', 
 'Mango Sticky Rice is a popular Thai dessert that is both sweet and satisfying
  This dish is made with sticky rice that is cooked in coconut milk and served with ripe mangoes and a sprinkle of toasted sesame seeds. 
  The combination of the sweet, creamy coconut milk and the fresh, juicy mangoes makes for a mouth-watering dessert that is loved by locals and tourists alike.
  The dish is typically served at room temperature, which allows the flavors to blend together perfectly.',
'dessert',
40,
'Dessert, Sweet, Thai, fruit'
'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/Mango_sticy_rice_%283859549574%29.jpg/1280px-Mango_sticy_rice_%283859549574%29.jpg',
'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/Mango_sticy_rice_%283859549574%29.jpg/1280px-Mango_sticy_rice_%283859549574%29.jpg',
),
(
'5','premium thai salad', 'ผัดไทย', 'Thai salad', 'Experience the explosive flavors of Isan ', 
 'Som Tam is a popular and spicy salad from Isan that is bursting with bold flavors
Made with shredded unripe papaya, chili peppers, garlic, fish sauce, lime juice, and palm sugar, this dish offers a perfect balance of sweet, sour, and spicy tastes. The salad is typically garnished with peanuts and tomatoes, adding a crunchy texture to the dish.
Som Tam is a delicious and satisfying salad that is perfect for those who love a bit of heat in their food.',
  'Main Courses',
40,
'Thai, Salad, stir fried'
'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Som_tam_thai.JPG/1024px-Som_tam_thai.JPG',
'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Som_tam_thai.JPG/1024px-Som_tam_thai.JPG',
),
(
'6','Mama spicy Mix', 'ยำมาม่า', 'Mama Mix', 'The ultimate noodle salad sensation!', 
 'Yum Mama is a Thai street food classic that offers a delicious and tangy mix of flavors and textures his dish is made with Mama noodles, a type of instant noodles that are popular in Thailand, and is combined with a mix of vegetables, herbs, and a zesty dressing. The dish is served cold and makes for a refreshing and light meal that is perfect for hot summer days.
  The combination of the noodles, crunchy vegetables, and the zesty dressing make Yum Mama a must-try dish for anyone who loves Thai food.',
 'Main Courses',
40,
 'Thai, Spicy, noodle',
'https://img.wongnai.com/p/1920x0/2018/06/03/a4d569965f15488b89bc3cae6732a4d1.jpg',
'https://img.wongnai.com/p/1920x0/2018/06/03/a4d569965f15488b89bc3cae6732a4d1.jpg',
),
(
'7','Drunken thai spaghetti',  'สปาเกตตี้ผัดขี้เมา', 'Thai spaghetti', 'The fiery Thai stir-fry that packs a punch', 
 'Pad Kee Mao Gai is a spicy and flavorful Thai stir-fry that is sure to satisfy your taste buds.
 This dish is made with tender chicken, wide rice noodles, and a mix of vegetables and aromatic herbs, such as bell peppers, onions, garlic, and Thai basil leaves. The stir-fry is cooked with a spicy chili paste sauce, which gives the dish its signature kick.
 the combination of textures and flavors make this dish a popular choice among Thai food enthusiasts.',
  'Main Courses',
45,
  'Thai, Spicy, pasta',
'https://cdn.pixabay.com/photo/2019/01/01/19/12/spaghetti-3907295_960_720.jpg',
'https://cdn.pixabay.com/photo/2022/05/03/09/51/spaghetti-7171375__340.jpg',
),
(
'8','Sudacha special', 'อาหารลับ อาม่าสุดดาชา', 'Sudacha Curry', 'The mysterious curry of Sudacha', 
 'Sudacha special is a curry fill with secret ingredient that can not be found any where in the world
  As you take your first bite of this mysterious curry, your taste buds are immediately hit with a burst of flavor that is both familiar and exotic. The curry is rich and fragrant, with a complex blend of spices that you can not quite put your finger on.
  The sauce is thick and creamy, coating the tender pieces of meat in a luxurious blanket of flavor. The meat itself is tender and succulent, falling apart at the slightest touch of your fork. As you chew, the spices continue to reveal themselves, each bite offering a slightly different combination of flavors.',
'Main Courses', 
  599,
  'Thai, curry, Spicy, soup',
'https://cdn.pixabay.com/photo/2022/06/07/20/52/curry-7249247__340.jpg',
'https://cdn.pixabay.com/photo/2022/06/07/20/52/curry-7249247__340.jpg',
)
;
