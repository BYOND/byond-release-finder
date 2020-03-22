BYOND Release Finder
====================
This repository provides a Jenkins pipeline that runs periodically, discovering new BYOND releases and making them available internally in the BYOND Labs cluster for subsequent builds to use them.

Build Status
------------
The intention of this pipeline is that the build status can be used to determine if a new BYOND release is available. If the pipeline has run and not discovered any new BYOND releases, the build status will be set to `NOT_BUILT`. If a new BYOND release has been discovered and successfully acquired, the build status will be set to `SUCCESS`.
