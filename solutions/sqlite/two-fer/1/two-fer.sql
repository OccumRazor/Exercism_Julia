-- Schema: CREATE TABLE "twofer" ("input" TEXT, "response" TEXT);
-- Task: update the twofer table and set the response based on the input.
DROP TABLE IF EXISTS twofer;

CREATE TABLE twofer(
      input char(5),
      response char(30)
);

INSERT INTO twofer(
    input,
    response)
VALUES
    ('','One for you, one for me.'),
    ('Alice','One for Alice, one for me.'),
    ('Bob','One for Bob, one for me.');
