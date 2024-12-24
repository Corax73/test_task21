CREATE OR REPLACE FUNCTION orders_update_listener()
RETURNS trigger AS
$$
BEGIN
IF EXISTS(
    SELECT
        id
    FROM
        statistics
    WHERE
        category_id = NEW.category_id
        AND product_id = NEW.product_id
        AND date = date(NEW.p_date)
        ) THEN
    UPDATE statistics
    SET amount = amount + NEW.amount
    WHERE category_id = NEW.category_id
    AND product_id = NEW.product_id
    AND date = date(NEW.p_date);
    RETURN NEW;
ELSE
    INSERT INTO statistics
    (date, category_id, product_id, amount)
    VALUES (date(NEW.p_date), NEW.category_id, NEW.product_id, NEW.amount);
    RETURN NEW;
END IF;
RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

CREATE OR REPLACE TRIGGER orders_event_update
AFTER
INSERT
    ON orders FOR EACH ROW EXECUTE FUNCTION orders_update_listener();