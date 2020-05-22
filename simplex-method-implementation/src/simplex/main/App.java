import java.util.concurrent.TimeUnit;

public class App {
    public static void main(String[] args) throws Exception {
        //36
        int[] L = {3, 4, 6};
        int[][] inequalities = {
            {2, 5, 2, 12},
            {7, 1, 2, 18}
        };

        //1813
        /*int[] L = {3, 4};
        int[][] inequalities = {
            {1, 1, 550},
            {2, 3, 1200},
            {12, 30, 9600}
        };*/

        //-5
        /*int[] L = {-1, -1};
        int[][] inequalities = {
            {1, 1, 6},
            {2, 1, 8},
            {0, 1, 2}
        };*/

        //Infinity
        /*int[] L = {2, 1, -2};
        int[][] inequalities = {
            {1, 1, -1, 8},
            {1, -1, 2, 2},
            {-2, -8, 3, 1}
        };*/

        Simplex s = new Simplex(L, inequalities);
        s.accelerate(1);
        s.solve();
    }

    private static class Simplex {
        private int[] L;
        private int[][] inequalities;
        private int width;
        private int height;
        private float[][] table;
        private String[] columns;
        private String[] rows;

        private int speed = 1000;

        private Simplex(int[] L, int[][] inequalities) {
            this.L = L;
            this.inequalities = inequalities;
            this.width = inequalities[0].length + inequalities.length + 1;
            this.height = inequalities.length + 1;
            this.table = new float[width][height];
            this.columns = defineColumns();
            this.rows = defineRows();
            //
            System.out.println("h: " + height);
            System.out.println("w: " + width);
            //
            fillTable();
        }

        private void accelerate(int speed) {
            this.speed = speed;
        }

        private void pause() {
            try {
                TimeUnit.MILLISECONDS.sleep(this.speed);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        private void fillTable() {
            for (int i = 0; i < height - 1; i++) {
                for (int j = 0; j < width; j++) {
                    if (j < inequalities[0].length - 1) {
                        table[j][i] = inequalities[i][j];
                    } else {
                        if (columns[j].equals(rows[i])) {
                            table[j][i] = 1;
                        } else if (columns[j].equals("n") && !rows[i].equals("L")) {
                            table[j][i] = inequalities[i][inequalities[0].length - 1];
                        } else {
                            table[j][i] = 0;
                        }
                    }
                }
            }
            for (int i = 0; i < L.length; i++) {
                int tmp;
                if (L[i] > 0) tmp = (L[i] - (L[i]*2));
                else if (L[i] < 0) tmp = (L[i] + (L[i]*2));
                else tmp = 0;
                table[i][height - 1] = tmp;
            }
            setRatios();
        }

        private String[] defineColumns() {
            String[] columns = new String[width];
            for (int i = 0; i < columns.length; i++) {
                if (i < width - 2) {
                    columns[i] = "x" + (i + 1);
                } else if (i < width - 1) {
                    columns[i] = "n";
                } else {
                    columns[i] = "r";
                }
            }
            return columns;
        }

        private String[] defineRows() {
            String[] rows = new String[height];
            for (int i = 0; i < rows.length; i++) {
                if (i != height - 1) {
                    rows[i] = "x" + (inequalities[0].length + i);
                } else {
                    rows[i] = "L";
                }
            }
            return rows;
        }

        private void printTable() {
            System.out.print("\t");
            for (String string : columns) {
                System.out.print(string + "\t");
            }
            System.out.println();
            for (int i = 0; i < height; i++) {
                System.out.print(rows[i] + "\t");
                for (int j = 0; j < width; j++) {
                    if (i != height - 1) {
                        System.out.print(table[j][i] + "\t");
                    } else {
                        if (j != width - 2 && j != width - 1) {
                            System.out.print(table[j][i] + "\t");
                        }
                    }
                    pause();
                }
                System.out.println();
            }
        }

        private int getColumnMinIndex() {
            int columnMinIndex = 0;
            float minElement = (float) table[0][height - 1];
            for (int i = 0; i < table[0].length; i++) {
                if (table[i][height - 1] < minElement) {
                    minElement = table[i][height - 1];
                    columnMinIndex = i;
                }
                
            }
            return columnMinIndex;
        }

        private int getRowMinIndex() {
            int rowMinIndex = 0;
            float minElement = (float) 0.0;
            boolean start = true;
            for (int i = 0; i < height - 1; i++) {
                for (int j = 0; j < width; j++) {
                    if (columns[j].equals("r") && !rows[i].equals("L")) {
                        if (start) {
                            minElement = table[j][i];
                            start = false;
                        } else {
                            if (table[j][i] < minElement) {
                                minElement = table[j][i];
                                rowMinIndex = i;
                            }
                        }
                    }
                }
            }
            return rowMinIndex;
        }

        private void setRatios() {
            int columnMinIndex = getColumnMinIndex();

            for (int i = 0; i < height; i++) {
                for (int j = 0; j < width; j++) {
                    if (!(j < inequalities[0].length - 1)) {
                        if (columns[j].equals("r") && !rows[i].equals("L")) {
                            if (inequalities[i][columnMinIndex] != 0) {
                                table[j][i] = inequalities[i][inequalities[0].length - 1] / inequalities[i][columnMinIndex];
                            } else {
                                table[j][i] = (float) 1000000000;
                            }
                        }
                    }
                }
            }
        }

        private void iterate() {
            int columnMinIndex = getColumnMinIndex();
            int rowMinIndex = getRowMinIndex();

            float[][] tmp = new float[table.length][table[0].length];
            for (int i = 0; i < tmp.length; i++) {
                for (int j = 0; j < tmp[0].length; j++) {
                    tmp[i][j] = table[i][j];
                }
            }

            System.out.println("\n");
            System.out.println("col: " + columnMinIndex + ", " + "row: " + rowMinIndex);

            rows[rowMinIndex] = columns[columnMinIndex];

            float suppElement = table[columnMinIndex][rowMinIndex];

            int count = 1;

            for (int i = 0; i < height; i++) {
                //columns[j]
                //rows[i]
                for (int j = 0; j < width; j++) {
                    //table[j][i]
                    if (i == rowMinIndex) {
                        table[j][i] = table[j][i] / suppElement;
                        // Выводит операцию
                        if (i != height - 1) {
                            System.out.print(count + ") " + tmp[j][i] + " / " + suppElement + " = " + table[j][i]);
                        } else {
                            if (j != width - 2 && j != width - 1) {
                                System.out.print(count + ") " + tmp[j][i] + " / " + suppElement + " = " + table[j][i]);
                            }
                        }
                    } else {
                        float self = tmp[j][i];
                        float row = tmp[j][rowMinIndex];
                        float col = tmp[columnMinIndex][i];
                        table[j][i] = self - ((row * col) / suppElement);
                        // Выводит операцию
                        if (i != height - 1) {
                            System.out.print(count + ") " + self + " - (" + row + " * " + col + " / " + suppElement + ") = " + table[j][i]);
                            pause();
                        } else {
                            if (j != width - 2 && j != width - 1) {
                                System.out.print(count + ") " + self + " - (" + row + " * " + col + " / " + suppElement + ") = " + table[j][i]);
                                pause();
                            }
                        }
                    }
                    count++;
                    System.out.println();
                }
            }
            setRatios();
        }

        private boolean finished() {
            for (int i = 0; i < table[0].length; i++) {
                if (table[i][height - 1] < 0.0) {
                    return false;
                }
            }
            return true;
        }

        private void solve() {
            System.out.println("Изначальная таблица");
            this.printTable();

            if (finished()) {
                System.out.println("Работа окончена");
            } else {
                int count = 1;
                while (true) {
                    System.out.println("Итерация " + count);
                    this.iterate();
                    this.printTable();
                    if (finished()) {
                        break;
                    }
                    count++;
                }
                System.out.println("Работа окончена");
            }
        }
    }
}
