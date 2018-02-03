public class Bucket {
	private PQ<Pokemon> pokeEntry;
	
	public Bucket() {
		pokeEntry = new PQ<Pokemon>();
	}
	
	public PQ<Pokemon> getBucket() {
		return pokeEntry;
	}
}
