-- Revert detector_lines:detector_lines from pg

BEGIN;

drop table tempseg.detector_lines;

COMMIT;
