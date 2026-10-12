DROP TABLE IF EXISTS tgimglog;
CREATE TABLE IF NOT EXISTS tgimglog (
	`id` integer PRIMARY KEY NOT NULL,
    `url` text,
    `referer` text,
	`ip` varchar(255),
	`time` DATE
);
DROP TABLE IF EXISTS imginfo;
CREATE TABLE IF NOT EXISTS imginfo (
	`id` integer PRIMARY KEY NOT NULL,
    `url` text,
    `referer` text,
	`ip` varchar(255),
	`rating` integer,
	`total` integer,
	`time` DATE
);


-- Every image view looks up / bumps imginfo by url and logs into tgimglog; without these D1 scanned the whole table
-- each time (D1 bills rows read). CREATE INDEX IF NOT EXISTS is safe to re-run on an existing database.
CREATE INDEX IF NOT EXISTS idx_imginfo_url ON imginfo(url);
CREATE INDEX IF NOT EXISTS idx_tgimglog_url ON tgimglog(url);
