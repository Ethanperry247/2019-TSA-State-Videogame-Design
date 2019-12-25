public class Enemy //added in 6.0
{
  //Identifiers
  private String name;
  private int level;
  
  private String weakAttackName;
  private String strongAttackName;
  
  private Item[] rewards;

  //Stats
  private float health;
  private float stamina;
  private float maxHealth;
  private float maxStamina;
  private float attack;
  private float defense;

  public Enemy(String n, float h, float s, float a, float d, String wA, String hA)
  {
    name = n;
    level = 0;
    health = h;
    stamina = s;
    maxHealth = h;
    maxStamina = s;
    attack = a;
    defense = d;
    
    weakAttackName = wA;
    strongAttackName = hA;

  }
  
  public Enemy(String n, float h, float s, float a, float d, String wA, String hA, Item[] i)
  {
    name = n;
    level = 0;
    health = h;
    stamina = s;
    maxHealth = h;
    maxStamina = s;
    attack = a;
    defense = d;
    
    rewards = i;
    
    weakAttackName = wA;
    strongAttackName = hA;

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
    return health;
  }
  
  void setStamina(float s)
  {
    stamina = s;
  }

  float getStamina()
  {
    return stamina;
  }

  void setAttack(float a)
  {
    attack = a;
  }

  float getAttack()
  {
    return attack;
  }

  void setDefense(float d)
  {
    defense = d;
  }

  float getDefense()
  {
    return defense;
  }

  void setMaxHealth(float h)
  {
    maxHealth = h;
  }

  float getMaxHealth()
  {
    return maxHealth;
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
  
  String getWeakAttack()
  {
    return weakAttackName;
  }
  
  String getStrongAttack()
  {
    return strongAttackName;
  }
  
  Item[] getRewards()
  {
    return rewards;
  }

}
