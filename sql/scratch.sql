--- cut from '~/repos/jem/osm/sql/views/versioned_routes_work.sql'

drop table if exists tempseg.detector_lines;

select refnum,direction,
       -- postgis magic to create a single line from a bunch of lines
       array_agg(detector_id) as detector_ids,  --- to later do lookups on this line
       -- st_makeline(geom) AS vdsline
       st_collect(geom) as geom --- to compare without lines
INTO tempseg.detector_lines
FROM
tempseg.tdetector
group by refnum,direction
;
