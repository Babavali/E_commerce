
-- Products Table
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
    `id` SERIAL PRIMARY KEY,
    `productReference` VARCHAR(50) UNIQUE NOT NULL,
    `productName` VARCHAR(100) NOT NULL,
    `productDescription` TEXT,
    `currency` VARCHAR(100) NOT NULL,
    `productPrice` DECIMAL(10,2) NOT NULL,
    `productStatus` VARCHAR(20) NOT NULL CHECK (status IN ('active', 'inactive', 'archived')),
    `created_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`platform_id`) REFERENCES `ecommerce_platforms`(`id`) ON DELETE CASCADE
);

-- Orders Table
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
    `id` SERIAL PRIMARY KEY,
    `currency` VARCHAR(100) NOT NULL,
    `platformType` VARCHAR(50) UNIQUE NOT NULL,
    `orderReference` VARCHAR(50) UNIQUE NOT NULL,
    `orderStatus` VARCHAR(20) NOT NULL CHECK (status IN ('pending', 'processing', 'shipped', 'delivered', 'cancelled', 'refunded')),
    `orderAmount` DECIMAL(10,2) NOT NULL,
    `order_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `customer_reference` VARCHAR(50) NOT NULL,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`platform_id`) REFERENCES `ecommerce_platforms`(`id`) ON DELETE CASCADE
);
