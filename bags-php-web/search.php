<?php include("db.php"); ?>
<?php include("check.php"); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php include("head.php"); ?>
</head>
<body>

    <?php include("nav.php"); ?>


    <section class="container mb-4 pt-4">
        <div class="row no-gutters">
            <div class="col-lg-11 col-10">
                <form action="search.php">
                    <div class="form-group">
                        <input type="search" name="q" value="<?= isset($_GET['q']) ? $_GET['q'] : '' ?>" class="form-control text-truncate rounded-0" placeholder="Найти по названию ...">
                    </div>
                </form>
            </div>
            <div class="col-lg-1 col-2">
                <button type="button" class="btn btn-dark ml-1 float-right rounded-0" data-toggle="modal" data-target="#filter" name="button">
                    <i class="fa fa-filter" aria-hidden="true"></i>
                </button>
            </div>
        </div>
        <div class="modal fade" id="filter" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content rounded-0">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Фильтр</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="search.html" method="get">
                            <div class="form-group">
                                <label for="brand_select">Выберите производителя</label>
                                <select name="brand" id="brand_select" class="form-control">
                                    <option value="#">Все</option>
                                    <option value="#">Chanel</option>
                                    <option value="#">H&M</option>
                                    <option value="#">Zara</option>
                                    <option value="#">Gucci</option>
                                    <option value="#">Armani</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">Применить</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <main class="container">
        <?php
        $sql = "SELECT * FROM bag";
        $extra = "";
        $link = "";

        // search and filter elements
        ////////////////////

        if (isset($_GET['q'])) {
            if ($_GET['q'] != null || $_GET['q'] != null) {
                $q = $_GET['q'];
                $link = $link . "&q=" . $q;
                $extra = $extra . " WHERE title LIKE '%$q%' OR description LIKE '%$q%'";
            }
        }

        //////////////////

        $limit = 8;
        $result = $conn->query($sql . $extra);

        if ($result->num_rows < 1) {
            echo "<p>Нет результатов! Попробуйте изменить данные поиска или фильтра.</p>";
            exit();
        }

        $pages = ceil($result->num_rows / $limit);

        $page = isset($_GET['page']) ? $_GET['page'] : 1;
        $start = ($page - 1) * $limit;
        $sql = $sql . $extra . " LIMIT $start, $limit";

        $result = $conn->query($sql);
        $bags = $result->fetch_all(MYSQLI_ASSOC);
        ?>
        <div class="row row-cols-2 row-cols-sm-3 row-cols-md-3 row-cols-lg-4 row-cols-xl-4">
            <?php foreach ($bags as $bag) : ?>
                <div class="col mb-4">
                    <div class="card rounded-0 border-0">
                        <img src="<?= $bag['image'] ?>" alt="Bag image" class="card-img-top rounded-0">
                        <div class="card-body px-0 pt-1">
                            <a href="bag.php?id=<?= $bag['id'] ?>">
                                <p class="card-text text-justify text"><?= $bag['title'] ?></p>
                            </a>
                            <h6 class="card-title pt-1">
                                <?= get_price($bag['id']) ?>
                                <span class="float-right"><i class="fa <?= check_for_like($bag['id']) ? 'fa-heart' : 'fa-heart-o' ?>" id="like_<?= $bag['id'] ?>" onclick="like(<?= $bag['id'] ?>)"></i></span>
                            </h6>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>

        <nav aria-label="Pagination">
            <ul class="pagination pagination-sm justify-content-center">
                <?php if ($pages > 1) : ?>
                    <?php for ($i=1; $i <= $pages; $i++) : ?>
                        <li class="page-item<?= ($page == $i) ? ' active' : ''; ?>"><a href="search.php?<?= 'page=' . $i . $link; ?>" class="page-link"><?= $i; ?></a></li>
                    <?php endfor; ?>
                <?php endif ?>
            </ul>
        </nav>

    </main>

    <!-- bootstrap -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <!-- own script -->
    <script src="js/script.js" charset="utf-8"></script>
</body>
</html>
