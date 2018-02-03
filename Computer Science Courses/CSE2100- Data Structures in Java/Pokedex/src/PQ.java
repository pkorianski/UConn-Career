import java.util.ArrayList;
import java.util.List;


public class PQ<E extends Comparable<E>> {
	  
	protected List<E> values = new ArrayList<E>();
	  
	  // Finds the size the the PQ
	  public int pqSize(){
		  return values.size(); 
	  }
	  
	  // Inserts and Entry e into the priority queue and calls upHead to restructure the PQ
	  public void insert(E e) {
	    values.add(e);
	    upHeap(values.size()-1);
	  }

	  // Removes an entry from the PQ and then returns the element with the highest value/priority
	  public E remove() {
	    int s = pqSize() - 1;
	    if (s < 0) { return null; }
	    E topElement = values.get(0);
	    replace(0, s);
	    values.remove(s);
	    downHeap(0);
	    return topElement;
	  }

	  
	  private void upHeap(int x) {
	    if (x < 1) { return; }
	    int indexP = (x-1)/2;
	    if (values.get(x).compareTo(values.get(indexP)) < 0) {
	      replace(x, indexP);
	      upHeap(indexP);
	    }
	  }

	  private void downHeap(int x) {
	    int left = (2*x) + 1;
	    int right = left+1;
	    if(left >= pqSize()){
	    	return; 
	    }
	    
	    int indexC = (right < pqSize() && values.get(left).compareTo(values.get(right)) > 0 ) ? right : left;
	    if(values.get(x).compareTo(values.get(indexC))>0){
	      replace(x, indexC);
	      downHeap(indexC);
	    }
	  }

	  private void replace(int i, int j) {
	    E e = values.get(i);
	    values.set(i, values.get(j));
	    values.set(j, e);
	  }

}
