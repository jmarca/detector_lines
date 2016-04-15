-- Verify detector_lines:detector_lines on pg

BEGIN;

select refnum,direction,detector_ids,geom
from tempseg.detector_lines
where false;

select 1/count(*)
from tempseg.detector_lines;


ROLLBACK;
