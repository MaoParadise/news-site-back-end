const express = require('express');
const router = express.Router();
const { isAuthenticated } = require('../helpers/helpers');
const release = require('../controllers/releaseControllers');
const releasePublic = require('../controllers/releasePublicControllers');


const pool = require('../database');

router.post('/add', isAuthenticated, release.addRelease);

router.put('/edit/:id', isAuthenticated, release.putRelease);

router.put('/state/:id', isAuthenticated, release.changeState);

router.post('/addRecord', isAuthenticated, release.addRecord);

router.get('/section', release.getAllSections);

router.get('/type', release.getAllTypes);

router.get('/MyReleases', isAuthenticated, release.getYourReleases);


router.post('/MyReleasesLike', isAuthenticated, release.getReleasesByTitleOrID)

router.post('/ReleasesByID', release.getReleasesByID)

router.post('/test', isAuthenticated, (req, res)=> {
    req.body;
    return res.json({
        status : 'OK',
        success : true
    });
})


/* only for the editor */
router.get('/ReleasesForEditor', isAuthenticated, release.getReleasesForEditor);

router.get('/ReleasesForEditorApproved', isAuthenticated, release.getReleasesForEditorApproved);

router.get('/ReleasesForEditorRejected', isAuthenticated, release.getReleasesForEditorRejected);

router.get('/ReleasesForEditorOnRevision', isAuthenticated, release.getReleasesForEditorOnRevision);

router.post('/ReleasesForEditorLike', isAuthenticated, release.getReleasesForEditorLike);

router.post('/addOutRecord', isAuthenticated, release.addOutRecord);

router.post('/DeleteOutRecord', isAuthenticated, release.deteleOutstandingReleases)

router.get('/getOutstandingReleases', release.getOutstandingReleases);



/* Publics routes */

router.post('/getReleasesPublic', releasePublic.getYourReleases);

router.post('/getReleasesPublicLike', releasePublic.getPublicReleasesLike)

router.post('/getReleasesPublicByType', releasePublic.getPublicReleasesByTypes)

router.post('/getReleasesPublicBySubSection', releasePublic.getPublicReleasesBySubSection)

router.get('/getReleasesPublicByID/:id', releasePublic.getPublicReleasesByID);

router.post('/getCouldBeInteresting', releasePublic.getCouldBeInteresting);


 
module.exports = router;