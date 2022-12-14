--/ <dataset>
--/ <summary> Team Keck Treasury Redshift Survey Catalog </summary>
--/ <remarks>
--/  The catalog includes redshifts and associated quality assessments, photometric 
--/  and astrometric measurements for all targets detected in  the 
--/  GOODS-North region.
--/ </remarks>
--/ <url>http://tkserver.keck.hawaii.edu/tksurvey/</url>
--/ <icon>tkrs.png</icon>
--/ <docpage>tkrs.html</docpage>
--/ </dataset>
 GO

-- CREATE SpecObj TABLE

--/ <summary>TKRS catalog of GOODS-North Field</summary>
--/ <remarks>TKRS catalog of GOODS-North Field</remarks>
CREATE TABLE dbo.SpecObj
(
	--/ <summary> Cartesian X (J2000)</summary>
	--/ <quantity>pos.eq.x;pos.frame=j2000</quantity>
	[cx] [float] NOT NULL,

	--/ <summary> Cartesian Y (J2000)</summary>
	--/ <quantity>pos.eq.y;pos.frame=j2000</quantity>
	[cy] [float] NOT NULL,

	--/ <summary> Cartesian Z (J2000)</summary>
	--/ <quantity>pos.eq.z;pos.frame=j2000</quantity>
	[cz] [float] NOT NULL,

	--/ <summary> HTM ID (J2000)</summary>
	--/ <quantity>pos.eq.HTM; pos.frame=j2000</quantity>
	[htmid] bigint NOT NULL,

	--/ <summary> Zone ID </summary>
	--/ <quantity>pos.eq.zone;pos.frame=j2000</quantity>
	[zoneid] int NOT NULL,

	--/ <summary> Serial number in Team Keck Survey </summary>
	--/ <quantity>meta.id;meta.main</quantity>
	[TKRS] bigint NOT NULL,

	--/ <summary> DEIMOS degree of Right Ascension (J2000) </summary>
	--/ <quantity>pos.eq.ra;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[RA] float NOT NULL,

	--/ <summary> DEIMOS Degree of Declination (J2000) </summary>
	--/ <quantity>pos.eq.dec;pos.frame=j2000</quantity>
	--/ <unit> deg </unit>
	[DEC] float NOT NULL,

	--/ <summary> DEIMOS R band (648.7&#177;81nm) in AB system </summary>
	--/ <quantity>phot.mag;em.opt.B</quantity>
	--/ <unit> mag </unit>
	[Rmag] real NOT NULL,

	--/ <summary> Mask number on which object was placed </summary>
	--/ <quantity>meta.id;instr.param</quantity>
	[Mask] smallint NOT NULL,

	--/ <summary>  Slit number for object on TKRS mask </summary>
	--/ <quantity>meta.id;instr.param</quantity>
	[Slit] int NOT NULL,

	--/ <summary> Topocentric redshift measured by TKRS </summary>
	--/ <quantity>src.redshift</quantity>
	[z] float NOT NULL,

	--/ <summary> Redshift code assigned by TKRS. Redshift code as follows:
	--/ -1=	star
	--/ 1=	redshift unmeasurable
	--/ 2=	redshift uncertain
	--/ 3=	90% confidence
	--/ 4=	99% confidence </summary>
	--/ <quantity>meta.code;src.redshift</quantity>
	[q_z] smallint NOT NULL,

	--/ <summary> Alternate redshift from other works </summary>
	--/ <quantity>src.redshift</quantity>
	[zOther] real NOT NULL,

	--/ <summary> Source of alternate redshift </summary>
	--/ <quantity>meta.ref;src.redshift</quantity>
	[r_zOther] smallint NOT NULL,

	--/ <summary> X position on the DEIMOS mosaic image </summary>
	--/ <quantity>pos.cartesian.x;instr.det</quantity>
	--/ <unit> pix </unit>
	[XpixD] real NOT NULL,

	--/ <summary> Y position on the DEIMOS mosaic image </summary>
	--/ <quantity>pos.cartesian.y;instr.det</quantity>
	--/ <unit> pix </unit>
	[YpixD] real NOT NULL,

	--/ <summary> Sector number in which the object lies on the HST/ACS mosaic image. As shown in the figure made by the GOODS team at </summary>
	--/ <quantity>meta.id;instr.det</quantity>
	[ACS] smallint NOT NULL,

	--/ <summary> X position on the HST/ACS mosaic image </summary>
	--/ <quantity>pos.cartesian.x;instr.det</quantity>
	--/ <unit> pix </unit>
	[XpixG] real NOT NULL,

	--/ <summary> Y position on the HST/ACS mosaic image </summary>
	--/ <quantity>pos.cartesian.y;instr.det</quantity>
	--/ <unit> pix </unit>
	[YpixG] real NOT NULL,

	--/ <summary> DEIMOS semi-major axis. Measured by SExtractor on DEIMOS mosaic image. </summary>
	--/ <quantity>phys.angSize.smajAxis</quantity>
	--/ <unit> arcsec </unit>
	[MajAxis] real NOT NULL,

	--/ <summary> DEIMOS ellipticity (1-a/b). Measured by SExtractor on DEIMOS mosaic image. </summary>
	--/ <quantity>src.ellipticity</quantity>
	[e2] real NOT NULL,

	--/ <summary> [-90/140] DEIMOS major axis position angle. Measured by SExtractor on DEIMOS mosaic image (North=0, East=+90). </summary>
	--/ <quantity>pos.posAng</quantity>
	--/ <unit> deg </unit>
	[PA] real NOT NULL,

	--/ <summary> GOODS-N v1.0 catalog IAU identification. Of objects matching the DEIMOS catalogue from Giavalisco et al. (2004, in 
	--/ Cat. II/261). </summary>
	--/ <quantity>meta.id.cross</quantity>
	[GOODS] char(20) NOT NULL,

	CONSTRAINT [PK_SpecObj] PRIMARY KEY CLUSTERED
(
	[TKRS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

	