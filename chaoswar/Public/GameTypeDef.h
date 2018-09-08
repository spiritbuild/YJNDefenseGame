// 敌人种类
typedef enum {
	//FOOT步兵
	ET_FOOT1,  
	ET_FOOT2,
	ET_FOOT3,
    ET_FOOT4,
    ET_FOOT5,
    ET_FOOT6,
    ET_FOOT7,
    ET_FOOT8,
    ET_FOOT9,
    ET_FOOT10,
    ET_FOOT11,
    ET_FOOT12,
    ET_FOOT13,
    ET_FOOT14,
    ET_FOOT15,
    ET_FOOT16,
    ET_FLY1,  
	ET_FLY2,
    ET_FLY3,
    ET_MAGIC1,  
	ET_MAGIC2,
    ET_BOSS1,  
	ET_BOSS2,
    ET_SHOOT1
} TEnemyType;

// 敌人种类
typedef enum {
	//FOOT步兵
	TSS_NORMAL,
    TSS_DEADING,
    TSS_DEAD
} TSpriteStatus;

// 敌人种类
typedef enum {
	//FOOT步兵
	MS_NORMAL,
    MS_DEADING,
	MS_FIRE,
	MS_STOP,
	MS_THUNDER,
    MS_SPEEDUP,
    MS_SLOW,
    MS_LIFEUP,
    MS_FREEZE
} TMMagicStatus;

// 攻击类型
typedef enum {
	AT_NORMAL,
	AT_MAGIC
} TAcctactType;

// 防御类型
typedef enum {
	DT_NO,
	DT_MAGIC,
    DT_HIGH
} TDefenceType;

// 屏幕状态
typedef enum {
	SCT_ALL,
	SCT_ONLYWHITE,
    SCT_NOTWHITE,
	SCT_ALLSPRITE,
	SCT_TOWER,
	SCT_UNIT,
	SCT_ENEMY,
	SCT_FRIENDLY,
	SCT_NONE,
} TScreenClickType;

// 操作状态
typedef enum {
	OT_NORMAL,
	OT_MAGIC_FIRE,
	OT_MAGIC_FRIENDLY,
	OT_MAGIC_STOP,
	OT_MAGIC_THUNDER,
	OT_BUILDING,
	OT_SELL,
	OT_UPDATE,
    OT_SETSEARCHPOINT,
	OT_NONE,
} TOperateType;

// 地图类型
typedef enum {
	MT_GREEN,
	MT_SNOW,
	MT_SAND
} TMapType;


// 单位位置
typedef enum {
	SP_FOOT,
	SP_AIR,
	SP_WATER
} TSpritePlace;

// 敌人状态
typedef enum {
	US_NORMAL,
	US_WAITING,
	US_ATTACT
} TUnitStatus;

