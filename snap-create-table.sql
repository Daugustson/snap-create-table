ALTER DATABASE daugustson CHARACTER SET utf8 COLLATE utf8_unicode_ci;

DROP TABLE IF EXISTS articleTag;
DROP TABLE IF EXISTS article;
DROP TABLE IF EXISTS tag;
DROP TABLE IF EXISTS author;

CREATE TABLE author (
      authorID BINARY(16) NOT NULL,
      authorAvatarUrl VARCHAR(255),
      AuthorActivationToken CHAR(32),
      authorEmail VARCHAR(128) NOT NULL,
      authorHash CHAR(97) NOT NULL,
      AuthorUsername  VARCHAR(32) NOT NULL,

      UNIQUE(authorEmail),
      UNIQUE(AuthorUsername),
      INDEX(authorEmail),
      PRIMARY KEY(authorID)
);

CREATE TABLE tag(
      tagID BINARY(16) NOT NULL,
      tagName  VARCHAR(32) NOT NULL,

      PRIMARY KEY (tagID)
);

CREATE TABLE article (
      articleId BINARY(16) NOT NULL,
      articleAuthorId  BINARY(16) NOT NULL,
      articleContent BLOB(4000) NOT NULL,
      articleDate DATETIME(6) NOT NULL,
      articleImage varchar(128) NOT NULL,

      INDEX(articleAuthorId),
      FOREIGN KEY(articleAuthorId) REFERENCES author(authorID),

      PRIMARY KEY (articleId)
);

CREATE TABLE articleTag (
       articleTagArticleId BINARY (16),
       articleTagTagId BINARY (16),
      index (articleTagArticleId),
      index (articleTagTagId),
      FOREIGN KEY(articleTagArticleId) REFERENCES article(articleId),
      FOREIGN KEY(articleTagTagId) REFERENCES tag(tagId)

);


