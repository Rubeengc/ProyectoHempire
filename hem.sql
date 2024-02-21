create database hempire;
use hempire;
-- Crear tabla Usuarios
CREATE TABLE Usuarios (
    id INT PRIMARY KEY not null auto_increment,
    username VARCHAR(255),
    contraseña VARCHAR(255),
    correo VARCHAR(255),
    edad INT,
    nombre VARCHAR(255),
    apellidos VARCHAR(255),
    fechareg DATE
);

-- Insertar datos en la tabla Usuarios
INSERT INTO Usuarios ( username, contraseña, correo, edad, nombre, apellidos, fechareg)
VALUES
('xX_pepe69_Xx', '1111', 'pepelachupa@gmail.com', 37, 'pepe', 'de pura', '2009-05-11'),
('miausculos', '2222', 'miausculos@gmail.com', 19, 'miausculos', 'manteiga', '2015-08-13'),
('carlongas', '3333', 'carlongas@gmail.com', 37, 'Carlos', 'maricon', '2009-09-15');

-- Crear tabla Productos
CREATE TABLE Productos (
    id INT PRIMARY KEY not null auto_increment,
    nombre VARCHAR(255),
    precio DECIMAL(10, 2),
    descripcion varchar(3000),
    img varchar(1000),
    stock INT,
    numvendidos INT
);

-- Insertar datos en la tabla Productos
INSERT INTO Productos ( nombre, precio, descripcion, img, stock, numvendidos)
VALUES
('Grinder', 9.99, 'Dispositivo esencial para los amantes de las hierbas secas. Diseñado con dientes afilados, tritura rápidamente para obtener una consistencia fina. Su construcción robusta y compacta lo hace perfecto para llevarlo a cualquier parte. Ideal para fumar cigarrillos enrollados o pipas, un grinder garantiza una experiencia más fácil y conveniente. Además, algunos modelos incluyen funciones extra, como almacenamiento integrado. ¡Haz que tu ritual sea más eficiente con un grinder de calidad!','https://www.mascotte.es/media/catalog/product/cache/e2d85fcaf83eff66e4414fdf79cc5d1f/m/a/mascotte_grinder_design_onderdelen.png', 100, 47),
('Pipa', 15.99, 'Una pipa de fumar es el accesorio perfecto para disfrutar de tus hierbas favoritas con estilo. Diseñada para una experiencia suave, las pipas son compactas y portátiles, ideales para llevar a cualquier lugar. Con una construcción duradera y estética, las pipas ofrecen un método clásico y elegante para disfrutar de tus momentos de relajación. Descubre el placer de fumar con una pipa que combine funcionalidad y estilo, elevando tu experiencia a un nuevo nivel.','https://m.media-amazon.com/images/I/51ETIIkQrEL.jpg', 80, 47),
('Papeles', 1.30, '"Los papeles son esenciales para cualquier entusiasta. Diseñados para ofrecer una combustión uniforme, estos papeles son delgados y prácticos. Ideales para enrollar cigarrillos personalizados, proporcionan una experiencia suave y sin complicaciones. Su tamaño compacto los hace fáciles de llevar a todas partes. Descubre la conveniencia y la calidad con papeles para fumar, el complemento perfecto para disfrutar de tus hierbas de manera personalizada y sencilla. Eleva tu experiencia de fumar con estos papeles diseñados para satisfacer tus necesidades.','https://m.media-amazon.com/images/I/71l29KVHY8L.jpg', 200, 85),
('Shisha', 44.99, 'La shisha es la elección perfecta para quienes buscan una experiencia de fumar relajante y social. Con un diseño elegante, estas pipas de agua ofrecen un método suave para disfrutar de tabaco aromatizado o hierbas. Su construcción duradera y atractiva hace que la shisha sea una adición llamativa a cualquier reunión. Fácil de usar, solo requiere agua y carbones para crear vapor sabroso y suave. Descubre la cultura del narguile con una shisha que combina estilo y funcionalidad, brindando una experiencia única y compartida. Eleva tus momentos de relajación con la shisha, una elección clásica para disfrutar de fumar de una manera más social y distinguida.','https://m.media-amazon.com/images/I/71z4YcZDszL.jpg', 80, 47),
('Bong', 15.99, 'El bong es la elección ideal para una experiencia de fumar potente y suave. Con un diseño eficiente, estos dispositivos filtran y enfrían el humo, proporcionando una inhalación más suave. Su construcción robusta y estilizada hace que el bong sea un accesorio atractivo. Fácil de usar, solo necesitas agua y hierbas para disfrutar de una fumada intensa. Descubre el placer del bong, que combina funcionalidad y diseño para una experiencia de fumar inigualable. Eleva tus sesiones con el bong, una opción clásica y efectiva para los amantes de la fumada potente y refrescante.','https://m.media-amazon.com/images/I/51aQ5r1tZCL.jpg', 90, 43),
('Bandeja', 15.99, 'Una bandeja personalizada es la compañera perfecta para organizar tus utensilios. Con un diseño funcional, estas bandejas son espaciosas y cuentan con compartimentos para mantener tus hierbas, papeles, y accesorios en orden. Su construcción resistente facilita la preparación de tus elementos para fumar de manera conveniente. Además, algunas bandejas cuentan con diseños decorativos para agregar estilo a tu espacio. Descubre la comodidad y organización que ofrece una bandeja para fumar, haciéndola esencial para cualquier entusiasta. Eleva tu experiencia de fumar con una bandeja diseñada para hacer que cada sesión sea más fácil y organizada.','https://www.alchimiaweb.com/images/xl/bandeja-fumador-dunkees_11513_1_20200311100054_.jpg', 80, 47),
('Mechero', 2.99, 'Un mechero personalizado es el toque único para tus sesiones de fumar. Con un diseño exclusivo, estos encendedores reflejan tu estilo y personalidad. Compactos y prácticos, son ideales para llevar a todas partes. Su construcción duradera garantiza un encendido confiable en cada uso. Descubre la elegancia de un mechero que lleva tu marca personal, haciendo que cada momento de fumar sea especial. Eleva tu experiencia con un encendedor que no solo enciende, sino que también añade un toque distintivo a tu ritual diario.','https://i.ebayimg.com/images/g/RigAAOSwrz1fd2-t/s-l1200.webp', 60, 147),
('Vaporizador', 27.99, 'Los vaporizadores ofrecen una experiencia de fumar moderna y discreta. Con diseños elegantes y tecnología avanzada, estos dispositivos calientan hierbas o líquidos para producir vapor en lugar de humo. Compactos y portátiles, los vaporizadores son ideales para usar sobre la marcha. Su construcción de alta calidad garantiza un vapor suave y sabroso en cada inhalación. Descubre la comodidad y eficiencia de un vaporizador que se adapta a tu estilo de vida. Eleva tu experiencia de fumar con la innovación y discreción que ofrece un vaporizador, brindando una alternativa moderna y sofisticada a las formas tradicionales de fumar.','https://m.media-amazon.com/images/I/51yMexFkzhL._AC_UF894,1000_QL80_.jpg', 120, 73),
('Bascula', 18.99, 'Una báscula personalizada es la herramienta esencial para medir con precisión tus ingredientes. Con un diseño funcional y compacto, estas básculas son perfectas para pesar hierbas o líquidos con exactitud. Su construcción resistente garantiza mediciones confiables en cada uso. Además, algunas básculas cuentan con características adicionales, como pantallas digitales fáciles de leer y funciones de tara para facilitar la preparación. Descubre la precisión y conveniencia que ofrece una báscula personalizada, haciéndola imprescindible para cualquier aficionado. Eleva tu experiencia con una báscula diseñada para hacer que cada medición sea fácil y precisa.','https://www.growbarato.net/33973-large_default/bascula-myco-mm-100.jpg', 8, 50),
('Amnesia CBD', 5.99, 'Amnesia CBD es una variante de la famosa cepa Amnesia, reconocida por su potencia y perfil sativa. Esta versión enriquecida con CBD ofrece beneficios terapéuticos sin los efectos psicoactivos pronunciados del THC. Con su característico aroma cítrico y terroso, Amnesia CBD es una opción popular para aquellos que buscan un equilibrio entre claridad mental y propiedades relajantes. Perfecta para el bienestar diurno, esta cepa es apreciada en la comunidad del cannabis terapéutico.','https://www.cannaconnection.com/12083/amnesia-haze.jpg', 100, 23),
('OG Kusk CBD', 5.99, 'OG Kush CBD es una variante de la icónica cepa OG Kush, conocida por sus propiedades terapéuticas y su distintivo perfil aromático. La versión rica en CBD ofrece beneficios para el bienestar sin los efectos psicoactivos intensos asociados al THC. Manteniendo el característico aroma terroso y a veces a diesel, OG Kush CBD es apreciada por aquellos que buscan una cepa clásica con propiedades calmantes y equilibradas.' ,'https://thetreecbd.com/wp-content/uploads/2018/08/cogollos-green-house-og-kush-2.jpg', 10, 407),
('Orange Bud CBD', 5.99, 'Orange Bud CBD es una variante que destaca por combinar las características de la clásica cepa Orange Bud con altos niveles de CBD. Esta cepa ofrece un perfil aromático cítrico y dulce, manteniendo propiedades terapéuticas sin provocar los efectos psicoactivos típicos del THC. Ideal para aquellos que buscan una experiencia relajante y sabores cítricos, Orange Bud CBD se ha convertido en una elección apreciada en el ámbito del cannabis de bienestar.' ,'https://bulkseedbank.org/wp-content/uploads/Original-Orange-Bud-FEM-1.jpg', 30, 150),
('Lemon Haze CBD', 5.99, 'Lemon Haze CBD es una variante de la clásica cepa Lemon Haze, reconocida por su aroma cítrico y su sabor vibrante. Esta versión cuenta con niveles significativos de CBD, ofreciendo propiedades terapéuticas sin los efectos psicoactivos asociados al THC. Perfecta para quienes buscan un alivio calmante con un toque refrescante, Lemon Haze CBD es una opción popular en el mundo del cannabis terapéutico.' ,'https://www.amsterdamgenetics.com/wp-content/uploads/2021/09/lemon_haze_prodpic-03-e1665999851421.jpg', 54, 76),
('Moonrock CBD', 8.99, 'Moonrock CBD es una variante que captura la esencia de los Moonrocks, conocidos por su potencia. Esta cepa, rica en CBD, ofrece beneficios terapéuticos sin los efectos psicoactivos típicos del THC. Inspirada en la tradición de los Moonrocks, esta opción combina flores de cannabis, aceite de CBD y kief, proporcionando una experiencia aromática y relajante. Perfecta para aquellos que buscan el equilibrio entre potencia y bienestar sin la intensidad psicoactiva.' ,'https://florprohibida.com/blog/wp-content/uploads/moonrock-por-dentro.jpg', 67, 134),
('Jack Herer CBD', 5.99, 'Jack Herer CBD, destacada por su equilibrio y características terapéuticas. Con niveles elevados de CBD y bajos en THC, ofrece beneficios sin producir efectos psicoactivos intensos. Reconocida por su perfil aromático a pino y cítricos, Jack Herer CBD es una elección popular para aquellos que buscan bienestar sin comprometer la claridad mental.','https://florprohibida.com/blog/wp-content/uploads/cogollo-jack-herer.jpg', 80, 54),
('Girl Scout CBD', 5.99, 'Girl Scout CBD es reconocida por su equilibrio entre sabores dulces y terrosos. Esta versión contiene niveles elevados de CBD, ofreciendo propiedades terapéuticas sin los efectos psicoactivos. Perfecta para aquellos que buscan alivio sin experimentar una sensación elevada, Girl Scout CBD es una opción apreciada en el ámbito del bienestar.','https://www.growbarato.net/33758-large_default/gb-cookies-100-feminizada.jpg', 80, 65),
('Sour Diesel CBD', 5.99, 'Sour Diesel CBD, por su perfil de sabor agrio y cítrico. Su alta concentración de CBD ofrece propiedades terapéuticas sin los efectos psicoactivos asociados con el THC. Ideal para aquellos que buscan alivio sin comprometer la claridad mental, Sour Diesel CBD es una opción popular para el bienestar.','https://admin.leafwell.com/app/uploads/2022/10/purple-kush-marijuana-strain-scaled.jpg', 80, 43),
('Semilla OG Kush', 6.99, 'La semilla de OG Kush CBD es una opción fascinante para los cultivadores que buscan combinar las propiedades terapéuticas del CBD con la genética clásica de la cepa OG Kush. Esta semilla produce plantas que mantienen el distintivo aroma y sabor de la OG Kush, pero con niveles más altos de CBD y bajos niveles de THC. Ideal para aquellos que desean cultivar su propia variedad terapéutica, la semilla de OG Kush CBD ofrece la posibilidad de disfrutar de los beneficios del cannabidiol sin los efectos psicoactivos intensos.','https://www.lahuertagrowshop.com/blog/wp-content/uploads/2016/08/como-germinar-semillas-marihuana.jpg', 80, 47),
('Semilla Dinamed CBD', 6.99, 'La semilla Dinamed CBD Autoflowering es una opción conveniente y eficiente para los cultivadores que buscan una cepa rica en CBD con el beneficio adicional de la autofloración. Esta semilla produce plantas que mantienen altos niveles de CBD y bajos niveles de THC, ofreciendo propiedades terapéuticas sin efectos psicoactivos significativos. Además, al ser autofloreciente, simplifica el proceso de cultivo al pasar automáticamente a la fase de floración, lo que acelera el tiempo de cosecha. Ideal para cultivadores principiantes o aquellos con limitaciones de tiempo, la Dinamed CBD Autoflowering es una elección práctica y efectiva.' ,'https://www.lahuertagrowshop.com/blog/wp-content/uploads/2016/08/como-germinar-semillas-marihuana.jpg', 45, 32),
('Semilla Industrial Plant CBD', 6.99, 'La semilla Industrial Plant Autoflowering CBD es una excelente opción para los cultivadores que buscan una cepa autofloreciente rica en CBD. Esta semilla produce plantas que mantienen niveles significativos de cannabidiol, con bajos niveles de THC, lo que la convierte en una opción ideal para aquellos que buscan beneficios terapéuticos sin experimentar efectos psicoactivos intensos. Además, al ser autofloreciente, simplifica el proceso de cultivo al pasar automáticamente a la fase de floración, lo que facilita su manejo y acelera el tiempo de cosecha. Perfecta para cultivadores con limitaciones de tiempo o experiencia, la Industrial Plant Autoflowering CBD ofrece una opción práctica y efectiva','https://www.lahuertagrowshop.com/blog/wp-content/uploads/2016/08/como-germinar-semillas-marihuana.jpg', 40, 57),
('Semilla Early Amnesia CBD', 6.99, 'La semilla Early Amnesia CBD es una opción emocionante para los cultivadores que desean combinar la genética potente de la cepa Amnesia con los beneficios terapéuticos del CBD. Esta semilla produce plantas que conservan el característico perfil sativa y el aroma cítrico de la Amnesia, pero con niveles elevados de CBD y bajos niveles de THC. Ideal para aquellos que buscan una experiencia terapéutica sin los efectos psicoactivos intensos, la Early Amnesia CBD también se destaca por su capacidad para florecer temprano, lo que acelera el proceso de cosecha. Una elección emocionante para cultivadores que buscan lo mejor de ambos mundos.','https://www.lahuertagrowshop.com/blog/wp-content/uploads/2016/08/como-germinar-semillas-marihuana.jpg', 87, 54),
('Semilla Dinamed Plus CBD ', 6.99, 'La semilla Dinamed CBD Plus es una excelente opción para los cultivadores que buscan altos niveles de CBD sin apenas rastro de THC. Esta semilla produce plantas con una proporción especialmente elevada de cannabidiol, ideal para aquellos que buscan beneficios terapéuticos sin experimentar los efectos psicoactivos asociados al THC. La Dinamed CBD Plus es conocida por su consistencia y fiabilidad en la producción de CBD puro, ofreciendo a los cultivadores una opción confiable para el cultivo de variedades terapéuticas.','https://www.lahuertagrowshop.com/blog/wp-content/uploads/2016/08/como-germinar-semillas-marihuana.jpg', 8, 34),
('Crema facial para pieles jovenes', 32.99, '¡Descubre la innovación en cuidado facial con nuestra Crema Facial para Piel Joven con CBD! Formulada especialmente para las necesidades de la piel joven, esta crema combina las propiedades rejuvenecedoras del cannabidiol (CBD) con ingredientes de alta calidad para brindar una experiencia de cuidado excepcional.','https://algologieinternational.com/wp-content/uploads/2021/10/P0426-1-1.jpg', 84, 69),
( 'Crema facial para pieles maduras', 25.99, '¡Despierta la juventud de tu piel con nuestra Crema Facial para Piel Madura con CBD! Especialmente diseñada para abordar las necesidades de la piel madura, esta crema combina la potencia regeneradora del cannabidiol (CBD) con ingredientes de alta calidad para ofrecer un cuidado facial excepcional.','https://algologieinternational.com/wp-content/uploads/2021/10/P0426-1-1.jpg', 50, 33),
('Leche para cuerpo', 22.99, '¡Embriágate de bienestar con nuestra Leche Corporal con CBD, una experiencia única de hidratación y relajación para tu piel! Diseñada para nutrir y rejuvenecer, esta leche corporal combina la riqueza de los ingredientes naturales con el poder regenerador del cannabidiol (CBD).','https://static.essensworld.com/images/goods/galleries/cbd06a/cbd06_body_milk1.png', 30, 79),
('Aceite CBD 5%', 20.99, '¡Explora el bienestar natural con nuestro Aceite de CBD al 5%! Este aceite cuidadosamente formulado ofrece una concentración equilibrada del 5% de cannabidiol (CBD), proporcionando una experiencia suave y versátil para tu bienestar diario.','https://m.media-amazon.com/images/I/61EHGQFpfnL.jpg', 20, 55),
('Aceite CBD 10%', 25.99, '¡Descubre la pureza y potencia de nuestro Aceite de CBD al 10%, un aliado natural para tu bienestar nocturno! Formulado con precisión, este aceite combina el 10% de cannabidiol (CBD) con ingredientes de alta calidad para ofrecer una experiencia de CBD de calidad premium.','https://m.media-amazon.com/images/I/61XnzpmrgoL._AC_UF894,1000_QL80_.jpg', 30, 98);



CREATE TABLE Parafernalia (
	id_parafernalia INT PRIMARY KEY auto_increment not null,
    marca VARCHAR(255),
    producto_id int not null,
	FOREIGN KEY (producto_id) REFERENCES Productos(id)
);

INSERT INTO Parafernalia ( marca,producto_id)
VALUES
( 'Champ High',1),
('Milano',2 ),
('RAW',3 ),
('Grav Labs',4 ),
('Grav Labs',5 ),
('RAW',6),
('Hempire',7 ),
('Smokers',8 ),
('Bulldog',9 );


CREATE TABLE Flores (
    id_flores INT PRIMARY KEY auto_increment not null,
    cepa VARCHAR(255),
    tipo VARCHAR(255),
	porcent_comp DECIMAL(5, 2),
	producto_id int not null,

	FOREIGN KEY (producto_id) REFERENCES Productos(id)

);


INSERT INTO Flores ( cepa, tipo,porcent_comp, producto_id)
VALUES
('Amnesia CBD', 'sativa',17,10),
('OG Kush CBD', 'indica',18,11),
('Orange Bud CBD', 'sativa',23,12),
('Lemon Haze CBD', 'indica',25,13),
('Moonrock CBD', 'sativa',65,14),
('Jack Jerer CBD', 'indica',20,15),
('Girl Scout CBD', 'sativa',19,16),
('Sour Diesel CBD', 'indica',21,17);



CREATE TABLE Semillas (
    id_semillas int PRIMARY KEY auto_increment not null,
    cepa VARCHAR(255),
    tipo VARCHAR(255),
	producto_id int not null,

	FOREIGN KEY (producto_id) REFERENCES Productos(id)

);

INSERT INTO Semillas ( cepa, tipo, producto_id)
VALUES
( 'Semilla OG Kush CBD', 'feminizada',18),
( 'Semilla Industrial Plant CBD', 'feminizada',20),
( 'Semilla Dinamed CBD', 'feminizada',19),
( 'Semilla Dinamed Plus CBD', 'feminizada',22),
( 'Semilla Early Amnesia CBD', 'feminizada',21);



CREATE TABLE Derivados (
   id_derivado INT PRIMARY KEY auto_increment not null,
   tipo VARCHAR(255),
   producto_id int not null,

	FOREIGN KEY (producto_id) REFERENCES Productos(id)
);

-- Insertar datos en la tabla Derivados
INSERT INTO Derivados (  tipo,producto_id)
VALUES
( 'Crema Facial para pieles jovenes', 23),
( 'Crema Facial papra pieles maduras', 24),
( 'Aceite CBD 5%', 26),
( 'Leche para cuerpo', 25),
( 'Aceite CBD 10 %', 27);

CREATE TABLE Carrito (
    id INT PRIMARY KEY auto_increment not null,
	producto_id int not null,
    usuario_id int not null,

	FOREIGN KEY (producto_id) REFERENCES Productos(id),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

INSERT INTO Carrito (producto_id,usuario_id)
VALUES
(23,1),
(24,2),
(26,3),
(25,2),
(27,3);
