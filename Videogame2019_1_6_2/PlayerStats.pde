public class PlayerStats
{
  //Identifiers
  private String name;
  private String className;
  private int level;

  //Stats
  private float health;
  private float stamina;
  private float maxHealth;
  private float maxStamina;

  private float attack;
  private float defense;
  
  //Modifiers
  private float healthMod;
  private float defenseMod;
  private float attackMod;

  public PlayerStats(String n, String c)
  {
    name = n;
    className = c;
    level = 0;
    health = 100;
    stamina = 100;
    maxHealth = 100;
    maxStamina = 100;
    attack = 2;
    defense = 1;
    healthMod = 0;
    defenseMod = 0;
    attackMod = 0;
  }
  
  void setModifiers(float h, float d, float a)
  {
    healthMod = h;
    defenseMod = d;
    attackMod = a;
  }

  void levelUp()
  {
    level++;
  }

  int getLevel()
  {
    return level;
  }

  void setHealth(float h)
  {
    health = h;
  }

  float getHealth()
  {
    return health + healthMod;
  }

  void setAttack(float a)
  {
    attack = a;
  }

  float getAttack()
  {
    return attack + attackMod;
  }

  void setDefense(float d)
  {
    defense = d;
  }

  float getDefense()
  {
    return defense + defenseMod;
  }

  void setStamina(float s)
  {
    stamina = s;
  }

  float getStamina()
  {
    return stamina;
  }

  void setMaxHealth(float h)
  {
    maxHealth = h;
  }

  float getMaxHealth()
  {
    return maxHealth + healthMod;
  }

  void setMaxStamina(float s)
  {
    maxStamina = s;
  }

  float getMaxStamina()
  {
    return maxStamina;
  }

  String getPlayerName()
  {
    return name;
  }

  String getClassName()
  {
    return className;
  }

  void setPlayerName(String n)
  {
    name = n;
  }

  void setClassName(String n)
  {
    className = n;
  }
}
