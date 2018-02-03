   
public class Queens {
    private int _n;
    private int _nb;
    public Queens(int n) { _n = n;_nb = 0;}
    public static void main(String[] args) {
        new Queens(8).run();
    }
    public void run() {
        int queens[] = new int[_n];
        dfs(queens,0);
        System.out.format("#sol = %d\n",_nb);
    }
    void dfs(int q[],int from) {
        if (from < q.length) {
            for(int v=0;v < _n;v++) {
                q[from] = v;
                dfs(q,from+1);
            }
        } else {
            if (check(q,0)) {
                System.out.format("sol: ");
                for(int i=0;i < q.length;i++)
                    System.out.format("%s,",q[i]);
                System.out.format("\b\n");
                _nb += 1;
            }
        }
    }
    boolean check(int q[],int from) {
        if (from < q.length)
            if (scanViolation(q[from],q,from+1,1))
                return false;
            else return check(q,from+1);
        else return true;
    }
    boolean scanViolation(int r,int q[],int from,int d) {
        if (from < q.length) {
            if (r == q[from] || r== q[from] + d || r == q[from] - d)
                return true;
            else return scanViolation(r,q,from+1,d+1);
        } else 
            return false;
    }
}
