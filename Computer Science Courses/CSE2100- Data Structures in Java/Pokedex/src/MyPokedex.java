
public class MyPokedex implements Pokedex {

	private int capDex = 100; // Set amount of lots the pokemon can be added to
	Bucket[] dex = new Bucket[capDex];
	
	public MyPokedex() {
		insertBuckets();
	}
	
	// Ensures that for each index the pokemon that is added is added to the PQ
	public void insertBuckets(){
		int counter = 0;
		while(counter < capDex){
			dex[counter] = new Bucket();
			counter++;
		}
	}
	
	private int hashCode(String name){
	    return Math.abs(name.hashCode()) % capDex;
	}
	
	// add a Pokemon v into the Pokedex, the name is given v.
	@Override
	public void add(Pokemon v) {
		int pokeHash = hashCode(v.getName());
		dex[pokeHash].getBucket().insert(v);	
	}

	// add a Pokemon v with name k into the Pokedex
	@Override
	public void add(String k, Pokemon v) {
		int pokeHash = hashCode(k);
		dex[pokeHash].getBucket().insert(v);	
	}

	// Remove a Pokemon with name k from the Pokedex.
	// If there are several with the same name, return the one with the largest total points.
	// If there are no Pokemon with the given name, return null.
	@Override
	public Pokemon remove(String k) {
		int pokeHash = hashCode(k);
		Pokemon highestTotal = dex[pokeHash].getBucket().remove();
		return highestTotal;
	}

	// Return the number of pokemon with a given name in the Pokedex.
	@Override
	public int count(String k) {
		int pokeHash = hashCode(k);
		int numberOfPokemon =  dex[pokeHash].getBucket().pqSize();
		return numberOfPokemon;
	}

}
