
-- Products Table
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
    `id` SERIAL PRIMARY KEY,
    `platform_id` BIGINT UNSIGNED NOT NULL,
    `product_reference` VARCHAR(50) UNIQUE NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `description` TEXT,
    `price` DECIMAL(10,2) NOT NULL,
    `status` VARCHAR(20) NOT NULL CHECK (status IN ('active', 'inactive', 'archived')),
    `created_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`platform_id`) REFERENCES `ecommerce_platforms`(`id`) ON DELETE CASCADE
);

-- Orders Table
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
    `id` SERIAL PRIMARY KEY,
    `platform_id` BIGINT UNSIGNED NOT NULL,
    `order_reference` VARCHAR(50) UNIQUE NOT NULL,
    `status` VARCHAR(20) NOT NULL CHECK (status IN ('pending', 'processing', 'shipped', 'delivered', 'cancelled', 'refunded')),
    `amount` DECIMAL(10,2) NOT NULL,
    `order_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `customer_reference` VARCHAR(50) NOT NULL,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`platform_id`) REFERENCES `ecommerce_platforms`(`id`) ON DELETE CASCADE
);
