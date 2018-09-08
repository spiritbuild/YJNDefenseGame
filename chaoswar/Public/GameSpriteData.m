#import "GameSpriteData.h"
#import "cocos2d.h"
#import "GameController.h"
#import "UpdateInfoList.h"

float getArrowTower1AttactTime()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:5];
    if(level == 3)
    {
        return 1.1;
    }
	else
    {
        return 1.4;
    }
}

float getArrowTower2AttactTime()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:5];
    if(level == 3)
    {
        return 0.8;
    }
	else
    {
        return 1;
    }
}

float getArrowTower3AttactTime()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:5];
    if(level == 3)
    {
        return 0.65;
    }
	else
    {
        return 0.8;
    }
}

float getArrowTower1Attact()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:5];
    if(level >= 2)
    {
        return 10;
    }
	else
    {
        return 8;
    }
}

float getArrowTower2Attact()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:5];
    if(level >= 2)
    {
        return 14;
    }
	else
    {
        return 12;
    }
}

float getArrowTower3Attact()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:5];
    if(level >= 2)
    {
        return 18;
    }
	else
    {
        return 15;
    }
}

float getDefenceTower1AttactTime()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:6];
    if(level >= 2)
    {
        return 8;
    }
	else
    {
        return 9;
    }
}

float getDefenceTower2AttactTime()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:6];
    if(level >= 2)
    {
        return 7;
    }
	else
    {
        return 8;
    }
}

float getDefenceTower3AttactTime()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:6];
    if(level >= 2)
    {
        return 6;
    }
	else
    {
        return 7;
    }
}

float getDefenceTower1HP()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:6];
    if(level == 3)
    {
        return 50;
    }
	else
    {
        return 35;
    }
}

float getDefenceTower2HP()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:6];
    if(level == 3)
    {
        return 70;
    }
	else
    {
        return 50;
    }
}

float getDefenceTower3HP()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:6];
    if(level == 3)
    {
        return 100;
    }
	else
    {
        return 70;
    }
}

float getTurrettower1Attact()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:7];
    if(level >= 2)
    {
        return 15;
    }
	else
    {
        return 12;
    }
}

float getTurrettower2Attact()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:7];
    if(level >= 2)
    {
        return 22;
    }
	else
    {
        return 18;
    }
}

float getTurrettower3Attact()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:7];
    if(level >= 2)
    {
        return 30;
    }
	else
    {
        return 25;
    }
}

float getTurrettower1AttactTime()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:7];
    if(level == 3)
    {
        return 2.3;
    }
	else
    {
        return 2.4;
    }
}

float getTurrettower2AttactTime()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:7];
    if(level == 3)
    {
        return 2.2;
    }
	else
    {
        return 2.3;
    }
}

float getTurrettower3AttactTime()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:7];
    if(level == 3)
    {
        return 2.1;
    }
	else
    {
        return 2.2;
    }
}

float getMagicTower1AttactTime()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:8];
    if(level == 3)
    {
        return 2;
    }
	else
    {
        return 2.1;
    }
}

float getMagicTower2AttactTime()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:8];
    if(level == 3)
    {
        return 1.9;
    }
	else
    {
        return 2;
    }
}

float getMagicTower3AttactTime()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:8];
    if(level == 3)
    {
        return 1.8;
    }
	else
    {
        return 1.9;
    }
}

float getMagicTower1Attact()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:8];
    if(level >= 2)
    {
        return 22;
    }
	else
    {
        return 17;
    }
}

float getMagicTower2Attact()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:8];
    if(level >= 2)
    {
        return 33;
    }
	else
    {
        return 28;
    }
}

float getMagicTower3Attact()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:8];
    if(level >= 2)
    {
        return 45;
    }
	else
    {
        return 40;
    }
}

float getMFLAttact()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:1];
    if(level >= 2)
    {
        return 60;
    }
	else
    {
        return 45;
    }
}

int getMFLLevel()
{
    int level = [UpdateInfoList getLevelByUpdataInfoId:1];
    return  level;
}

float getMCFireAttact()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:2];
    if(level >= 2)
    {
        return 25;
    }
	else
    {
        return 15;
    }
}

int getMCFireLevel()
{
    int level = [UpdateInfoList getLevelByUpdataInfoId:2];
    return  level;
}

float getMCLightAttact()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:3];
    if(level == 1)
    {
        return 100;
    }
	else if(level == 2)
    {
        return 150;
    }
    else
    {
        return 200;
    }
}

float getMCStoneAttact()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:4];
    if(level >= 2)
    {
        return 60;
    }
	else
    {
        return 30;
    }
}

float getMCStoneFanitTime()
{	
    int level = [UpdateInfoList getLevelByUpdataInfoId:4];
    if(level == 3)
    {
        return 4;
    }
	else
    {
        return 2;
    }
}

ccColor3B getHintFontColor()
{
    GameController *gc = [GameController getGameController];
    switch (gc.mapType) {
		case MT_GREEN:
            return ccc3(255,255,255);
            break;
        case MT_SAND:
            return ccc3(255,255,255);
			break;
        case MT_SNOW:
            return ccc3(255,51, 0);
			break;
		default:
            return ccc3(255,255,255);
			break;
	}
}

NSString* getEmptyName()
{
    GameController *gc = [GameController getGameController];
    switch (gc.mapType) {
		case MT_GREEN:
            return @"et01.png";
            break;
        case MT_SAND:
            return @"et03.png";
			break;
        case MT_SNOW:
            return @"et02.png";
			break;
		default:
            return @"et01.png";
			break;
	}
}
