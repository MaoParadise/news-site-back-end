const pool = require('../database');

const releaseCtrl = {}

releaseCtrl.addRelease = async (req, res) => {
    const {
        IDRELEASESTATE,
        IDRELEASETYPE,
        IDSECTION,
        TITLERELEASE,
        FIRSTSTATEMENTRELEASE,
        CONTENTRELEASE,
        SUBSECTION,
        MAINIMAGE,
        SINGLETITLE,
        SINGLEIMG
    } = req.body;
    const newRelease ={
        IDRELEASE : null,
        IDRELEASESTATE,
        IDRELEASETYPE,
        IDSECTION,
        TITLERELEASE, 
        FIRSTSTATEMENTRELEASE,
        CONTENTRELEASE,
        SUBSECTION,
        MAINIMAGE,
        SINGLETITLE,
        SINGLEIMG
    }
    let passportSession = req.session.passport;
    let timestamp = new Date(Date.now() - 14400000).toISOString();
    await pool.query('INSERT INTO r_elease SET ?', [newRelease], (err, result) => {
        if (err) {
            console.log(err);
            return res.json({
                message: 'The Release was not created becausa an unexpected error, check if the primary key is not duplicated',
                success: false
            });
        } else {
            let id = result.insertId;
            pool.query(`INSERT INTO release_record VALUES ('${id}', ${JSON.stringify(passportSession.user)}, '${timestamp}', '${timestamp}')`), (error)=> {
                if (error) {
                    return res.json({
                        message: 'The release_record was not created becausa an unexpected error, check if the primary key is not duplicated',
                        success: false
                    });
                }
            };
            return res.json({
                message: 'The Release was created succesfully',
                success: true
            })
        }
    }); 
}

releaseCtrl.putRelease = async (req, res) => {
    const {id} = req.params;
    await pool.query('UPDATE r_elease set ? WHERE IDRELEASE = ?', [req.body, id], (err, result) => {
        if (err) {
            return res.json({
                message: 'The Release was not modified because an unexpected error',
                success: false
            });
        }else{
            const timestamp = new Date(Date.now() - 14400000).toISOString();
            pool.query(`UPDATE release_record set MODIFIEDDATERELEASE = '${timestamp}' WHERE IDRELEASE = ${id}`), (error)=> {
                if (error) {
                    return res.json({
                        message: 'The release_record was not modified because an unexpected error',
                        success: false
                    });
                }
            };
            return res.json({
                message: 'The Release was modified succesfully',
                success: true
            })
        }
    }); 
    console.log(id);
    console.log(req.body);
}

releaseCtrl.changeState = async (req, res) => {
    const {id} = req.params;
    const { state } = req.body;
    await pool.query(`UPDATE r_elease set IDRELEASESTATE = ${state} WHERE IDRELEASE = ${id}`, (err, result) => {
        if (err) {
            return res.json({
                message: 'The State was not modified because an unexpected error',
                success: false
            });
        }else{
            const timestamp = new Date(Date.now() - 14400000).toISOString();
            pool.query(`UPDATE release_record set MODIFIEDDATERELEASE = '${timestamp}' WHERE IDRELEASE = ${id}`), (error)=> {
                if (error) {
                    return res.json({
                        message: 'The release_record was not modified because an unexpected error',
                        success: false
                    });
                }
            };
            return res.json({
                message: 'The State was modified succesfully',
                success: true
            }) 
        } 
    })
}

releaseCtrl.addRecord = async (req, res) => { 
    let passportSession = req.session.passport;
    const timestamp = new Date(Date.now() - 14400000).toISOString();
    pool.query(`INSERT INTO release_record VALUES ('3', 'MaoParadise','${timestamp}', '${timestamp}')`, function(err, result) {
        if (err) throw err;
    }); 
     
}

releaseCtrl.getYourReleases = async ( req, res) =>{
    let passportSession = req.session.passport;
    const rows =  await pool.query(`SELECT r_elease.* , release_record.MODIFIEDDATERELEASE FROM r_elease INNER JOIN release_record ON r_elease.IDRELEASE = release_record.IDRELEASE WHERE release_record.USERNAMEHELPER = ${JSON.stringify(passportSession.user)} ORDER BY release_record.MODIFIEDDATERELEASE DESC LIMIT 8`);
    return res.json(rows);
}


releaseCtrl.getReleasesByTitleOrID = async ( req, res) =>{
    const { search } = req.body;
    let passportSession = req.session.passport;
    const rows =  await pool.query(`SELECT r_elease.* , release_record.MODIFIEDDATERELEASE FROM r_elease INNER JOIN release_record ON r_elease.IDRELEASE = release_record.IDRELEASE WHERE release_record.USERNAMEHELPER = ${JSON.stringify(passportSession.user)} AND ( r_elease.SINGLETITLE LIKE '%${search}%' OR r_elease.IDRELEASE LIKE '%${search}%'  ) ORDER BY release_record.MODIFIEDDATERELEASE DESC LIMIT 8`);
    return res.json(rows);
}



releaseCtrl.getReleasesByID = async (req, res) => {
    let passportSession = req.session.passport;
    let { id } = req.body;
    const rows = await pool.query(`SELECT r_elease.* , release_record.MODIFIEDDATERELEASE FROM r_elease INNER JOIN release_record ON r_elease.IDRELEASE = release_record.IDRELEASE WHERE release_record.USERNAMEHELPER = ${JSON.stringify(passportSession.user)} AND r_elease.IDRELEASE = ${id}`);
    return res.json(rows);
}

releaseCtrl.getAllSections = async (req, res) =>{
    const rows =  await pool.query(`SELECT * FROM section`);
    return res.json(rows);
}

releaseCtrl.getAllTypes = async (req, res) =>{
    const rows =  await pool.query(`SELECT * FROM type`);
    return res.json(rows);
}



/*  Controllers only for the editor  */

releaseCtrl.getReleasesForEditor = async (req, res) =>{
    const rows =  await pool.query(`SELECT r_elease.* , release_record.MODIFIEDDATERELEASE, helper.NAMEHELPER, helper.LASTNAMEHELPER, helper.EMAILHELPER FROM r_elease INNER JOIN release_record ON r_elease.IDRELEASE = release_record.IDRELEASE INNER JOIN helper ON release_record.USERNAMEHELPER = helper.USERNAMEHELPER WHERE r_elease.IDRELEASESTATE BETWEEN 10 AND 12 ORDER BY release_record.MODIFIEDDATERELEASE DESC`);
    return res.json(rows);
}

releaseCtrl.getReleasesForEditorLike = async (req, res) =>{
    const { search } = req.body;
    const rows =  await pool.query(`SELECT r_elease.* , release_record.MODIFIEDDATERELEASE, helper.NAMEHELPER, helper.LASTNAMEHELPER, helper.EMAILHELPER FROM r_elease INNER JOIN release_record ON r_elease.IDRELEASE = release_record.IDRELEASE INNER JOIN helper ON release_record.USERNAMEHELPER = helper.USERNAMEHELPER WHERE ( r_elease.SINGLETITLE LIKE '%${search}%' OR r_elease.IDRELEASE LIKE '%${search}%'  OR release_record.USERNAMEHELPER LIKE '%${search}%' OR helper.NAMEHELPER LIKE '%${search}%' OR helper.LASTNAMEHELPER LIKE  '%${search}%' OR helper.EMAILHELPER LIKE '%${search}%'  )  ORDER BY release_record.MODIFIEDDATERELEASE DESC`);
    return res.json(rows);
}

releaseCtrl.getReleasesForEditorApproved = async (req, res) =>{
    const rows =  await pool.query(`SELECT r_elease.* , release_record.MODIFIEDDATERELEASE, helper.NAMEHELPER, helper.LASTNAMEHELPER, helper.EMAILHELPER FROM r_elease INNER JOIN release_record ON r_elease.IDRELEASE = release_record.IDRELEASE INNER JOIN helper ON release_record.USERNAMEHELPER = helper.USERNAMEHELPER WHERE r_elease.IDRELEASESTATE = 11 ORDER BY release_record.MODIFIEDDATERELEASE DESC`);
    return res.json(rows);
}

releaseCtrl.getReleasesForEditorRejected = async (req, res) =>{
    const rows =  await pool.query(`SELECT r_elease.* , release_record.MODIFIEDDATERELEASE, helper.NAMEHELPER, helper.LASTNAMEHELPER, helper.EMAILHELPER FROM r_elease INNER JOIN release_record ON r_elease.IDRELEASE = release_record.IDRELEASE INNER JOIN helper ON release_record.USERNAMEHELPER = helper.USERNAMEHELPER WHERE r_elease.IDRELEASESTATE = 12 ORDER BY release_record.MODIFIEDDATERELEASE DESC`);
    return res.json(rows);
}

releaseCtrl.getReleasesForEditorOnRevision = async (req, res) =>{
    const rows =  await pool.query(`SELECT r_elease.* , release_record.MODIFIEDDATERELEASE, helper.NAMEHELPER, helper.LASTNAMEHELPER, helper.EMAILHELPER FROM r_elease INNER JOIN release_record ON r_elease.IDRELEASE = release_record.IDRELEASE INNER JOIN helper ON release_record.USERNAMEHELPER = helper.USERNAMEHELPER WHERE r_elease.IDRELEASESTATE = 10 ORDER BY release_record.MODIFIEDDATERELEASE DESC`);
    return res.json(rows);
}

releaseCtrl.addOutRecord = async (req, res) => { 
    const { id, outType } = req.body;
    const timestamp = new Date(Date.now() - 14400000).toISOString();
    pool.query(`INSERT INTO outstanding_record VALUES (${id}, ${outType}, '${timestamp}');`, function(err, result) {
        if (err){
            return res.json({
                message: 'The outstanding_record was not created becausa an unexpected error, check if the primary key is not duplicated',
                success: false
            });
        }else{
            return res.json({
                message: 'The outstanding_record  was created succesfully',
                success: true
            })
        }
    }); 
}

releaseCtrl.getOutstandingReleases = async (req, res) =>{
    const rows =  await pool.query(`SELECT r_elease.* FROM r_elease INNER JOIN release_record ON r_elease.IDRELEASE = release_record.IDRELEASE INNER JOIN  outstanding_record ON r_elease.IDRELEASE = outstanding_record.IDRELEASE INNER JOIN outstanding_type ON outstanding_record.IDOUTTYPE = outstanding_type.IDOUTTYPE  WHERE r_elease.IDRELEASESTATE = 11 AND outstanding_record.IDOUTTYPE = 1 ORDER BY release_record.MODIFIEDDATERELEASE DESC`);
    return res.json(rows);
}

releaseCtrl.deteleOutstandingReleases = async (req, res)=>{
    /* DELETE FROM `outstanding_record` WHERE `outstanding_record`.`IDRELEASE` = 25 AND `outstanding_record`.`IDOUTTYPE` = 1 */
    const { id, outType } = req.body;
    pool.query(`DELETE FROM outstanding_record WHERE IDRELEASE = ${id} AND IDOUTTYPE = ${outType}`, function(err, result) {
        if (err){
            return res.json({
                message: 'The outstanding_record was not deleted',
                success: false
            });
        }else{
            return res.json({
                message: 'The outstanding_record  was  deleted succesfully',
                success: true
            })
        }
    }); 
}

module.exports = releaseCtrl;