const pool = require('../database');

const releasePublicCtrl = {}


releasePublicCtrl.getYourReleases = async ( req, res) =>{
    const {start, limit} = req.body;
    const rows =  await pool.query(`SELECT r_elease.* , release_record.MODIFIEDDATERELEASE FROM r_elease INNER JOIN release_record ON r_elease.IDRELEASE = release_record.IDRELEASE WHERE r_elease.IDRELEASESTATE = 11 ORDER BY release_record.MODIFIEDDATERELEASE DESC LIMIT ${start},${limit}`);
    return res.json(rows);
}

releasePublicCtrl.getPublicReleasesLike= async ( req, res ) => {
    const { like } = req.body;
    const rows =  await pool.query(`SELECT r_elease.* , release_record.MODIFIEDDATERELEASE FROM r_elease INNER JOIN release_record ON r_elease.IDRELEASE = release_record.IDRELEASE WHERE r_elease.IDRELEASESTATE = 11 AND r_elease.SINGLETITLE LIKE '%${like}%'  ORDER BY release_record.MODIFIEDDATERELEASE DESC`);
    return res.json(rows);
}

releasePublicCtrl.getPublicReleasesBySubSection = async (req, res) => {
    const {start, limit, like } = req.body;
    console.log(`SELECT r_elease.* , release_record.MODIFIEDDATERELEASE FROM r_elease INNER JOIN release_record ON r_elease.IDRELEASE = release_record.IDRELEASE WHERE r_elease.IDRELEASESTATE = 11 AND r_elease.SUBSECTION LIKE '%${like}%' ORDER BY release_record.MODIFIEDDATERELEASE DESC LIMIT ${start},${limit}`);
    const rows =  await pool.query(`SELECT r_elease.* , release_record.MODIFIEDDATERELEASE FROM r_elease INNER JOIN release_record ON r_elease.IDRELEASE = release_record.IDRELEASE WHERE r_elease.IDRELEASESTATE = 11 AND r_elease.SUBSECTION LIKE '%${like}%' ORDER BY release_record.MODIFIEDDATERELEASE DESC LIMIT ${start},${limit}`);
    return res.json(rows);
}

releasePublicCtrl.getPublicReleasesByTypes = async ( req, res) =>{
    const {start, limit, type} = req.body;
    const rows =  await pool.query(`SELECT r_elease.* , release_record.MODIFIEDDATERELEASE FROM r_elease INNER JOIN release_record ON r_elease.IDRELEASE = release_record.IDRELEASE WHERE r_elease.IDRELEASESTATE = 11 AND r_elease.IDRELEASETYPE = ${type} ORDER BY release_record.MODIFIEDDATERELEASE DESC LIMIT ${start},${limit}`);
    return res.json(rows);
}


releasePublicCtrl.getPublicReleasesByID = async (req, res) => {
    const { id } = req.params;
    const rows =  await pool.query(`SELECT r_elease.* , helper.USERNAMEHELPER, helper.NAMEHELPER, helper.LASTNAMEHELPER,  release_record.CREATEDDATERELEASE, release_record.MODIFIEDDATERELEASE FROM r_elease INNER JOIN release_record ON r_elease.IDRELEASE = release_record.IDRELEASE INNER JOIN helper ON release_record.USERNAMEHELPER = helper.USERNAMEHELPER WHERE r_elease.IDRELEASE = ${id} AND r_elease.IDRELEASESTATE = 11`);
    return res.json(rows);
}


releasePublicCtrl.getCouldBeInteresting = async (req, res) => {
    const {start, limit, like} = req.body;
    //const rows =  await pool.query(`SELECT r_elease.* , helper.USERNAMEHELPER, helper.NAMEHELPER, helper.LASTNAMEHELPER,  release_record.CREATEDDATERELEASE, release_record.MODIFIEDDATERELEASE FROM r_elease INNER JOIN release_record ON r_elease.IDRELEASE = release_record.IDRELEASE INNER JOIN helper ON release_record.USERNAMEHELPER = helper.USERNAMEHELPER WHERE r_elease.IDRELEASE = ${id} AND r_elease.IDRELEASESTATE = 11`);
    //return res.json(rows);
    let query = `SELECT r_elease.* , release_record.MODIFIEDDATERELEASE FROM r_elease INNER JOIN release_record ON r_elease.IDRELEASE = release_record.IDRELEASE WHERE r_elease.IDRELEASESTATE = 11 `;
    let queryLike = ``;
    /* `AND ( r_elease.SUBSECTION LIKE '%test%' OR r_elease.SUBSECTION LIKE '%serie%' OR r_elease.SUBSECTION LIKE '%netflix%')` */ 
    for(i= 0; i < like.length; i++){
        if(i == 0){
            queryLike = queryLike + `AND (`
        }
        queryLike = queryLike + `r_elease.SUBSECTION LIKE '%${like[i]}%'`
        if(like[i+1] != null || like[i+1] != undefined){
            queryLike = queryLike + ` OR `
        }else{
            queryLike = queryLike + ' )'
        }
    }
    query = query + queryLike;
    query = query + ` ORDER BY release_record.MODIFIEDDATERELEASE DESC LIMIT ${start},${limit}`;
    const rows =  await pool.query(query);
    return res.json(rows);
}

module.exports = releasePublicCtrl;