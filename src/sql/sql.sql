CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `password` varchar(32) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`userId`)  identity(1,1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
