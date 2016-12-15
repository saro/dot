#!/bin/bash

${HOME}/.i3/float_config.sh
cat ${HOME}/.i3/config \
    /tmp/conf_flo > /tmp/i3conf

i3-msg "restart"

