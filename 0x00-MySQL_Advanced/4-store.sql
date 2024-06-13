-- Creates a trigger that decreases the quantity 
-- of an item
DROP TRIGGER IF EXISTS decrease_quantity
DELIMETER //
CREATE TRIGGER decrease_quantity
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE products
    SET quantity = quantity - 1
    WHERE id = NEW.product_id;
END //
DELIMETER ;