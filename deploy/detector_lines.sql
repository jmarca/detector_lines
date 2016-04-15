-- Deploy detector_lines:detector_lines to pg
-- requires: tdetector:tdetector

BEGIN;


select refnum,direction,
       --- to later do lookups on this line
       array_agg(detector_id) as detector_ids,
       -- postgis magic to create a single line from a bunch of lines??
       -- st_makeline(geom) AS vdsline -- nope
       st_collect(geom) as geom --- to compare without lines
INTO tempseg.detector_lines
FROM
tempseg.tdetector
group by refnum,direction
;

CREATE INDEX tempseg_detector_lines_geom_index
       ON tempseg.detector_lines USING GIST ( geom );

COMMIT;
