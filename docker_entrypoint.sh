#!/bin/sh

if [[ -z "${APCUPSD_HOST}" ]]; then
    echo "missing APCUPSD_HOST env" 1>&2
    exit 1
fi

if [[ -z "${PROM_HOST}" ]]; then
    echo "missing PROM_HOST env" 1>&2
    exit 1
fi

./apcupsd_exporter -telemetry.addr ${PROM_HOST} -apcupsd.addr ${APCUPSD_HOST}
