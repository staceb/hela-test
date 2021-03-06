<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Index Page</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">

    </head>
    <body>
        <div class="container">
            <h1>DVD Library</h1>
            <hr/>
            <div class="navbar">
                <ul class="nav nav-tabs">
                    <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/displayDvdList">Display Library</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/search">Search</a></li>
                </ul> 
            </div>


            <div class="row">
                <div class="col-md-6">
                    <h2>Dvds</h2>
                    <table id="dvdTable" class="table table-hover">
                        <tr>
                            <th width="40%">Title</th>
                            <th width="30%">Rating</th>
                            <th width="15%"></th>
                            <th width="15%"></th>
                        </tr>
                        <tbody id="contentRows"></tbody>
                    </table>
                </div>

                <div class="col-md-6">
                    <h2>Add New Dvd Form</h2>
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="add-title"
                                   class="col-md-4 control-label">Title:</label>
                            <div class="col-md-8">
                                <input type="text"
                                       class="form-control"
                                       id="add-title"
                                       placeholder="Title" />
                            </div>
                        </div>
                    </form>

                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="add-release-date"
                                   class="col-md-4 control-label">Release Date:</label>
                            <div class="col-md-8">
                                <input type="text"
                                       class="form-control"
                                       id="add-release-date"
                                       placeholder="Release Date" />
                            </div>
                        </div>
                    </form>

                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="add-mpaa-rating"
                                   class="col-md-4 control-label">MPAA Rating:</label>
                            <div class="col-md-8">
                                <input type="text"
                                       class="form-control"
                                       id="add-mpaa-rating"
                                       placeholder="MPAA Rating" />
                            </div>
                        </div>
                    </form>

                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="add-director"
                                   class="col-md-4 control-label">Director:</label>
                            <div class="col-md-8">
                                <input type="text"
                                       class="form-control"
                                       id="add-director"
                                       placeholder="Director" />
                            </div>
                        </div>
                    </form>

                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="add-studio"
                                   class="col-md-4 control-label">Studio:</label>
                            <div class="col-md-8">
                                <input type="text"
                                       class="form-control"
                                       id="add-studio"
                                       placeholder="Studio" />
                            </div>
                        </div>
                    </form>

                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="add-note"
                                   class="col-md-4 control-label">Note:</label>
                            <div class="col-md-8">
                                <input type="text"
                                       class="form-control"
                                       id="add-note"
                                       placeholder="Note" />
                            </div>
                        </div>
                    </form>

                    <div class="form-group">
                        <div class="col-md-offset-4 col-md-8">
                            <button type="submit"
                                    id="add-button"
                                    class="btn btn-primary">
                                Create Dvd
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="detailsModal" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">
                            <span>&times;</span>
                            <span class="sr-only">Close</span>
                        </button>
                        <h4 class="modal-title" id="detailsModalLabel">Dvd Details</h4>
                    </div>
                
                    <div class="modal-body">
                        <h3 id="dvd-id"></h3>
                        <table class="table table-bordered">
                            <tr>
                                <th>Title:</th>
                                <td id="dvd-title"></td>
                            </tr>
                            <tr>
                                <th>Release Date:</th>
                                <td id="dvd-releaseDate"></td>
                            </tr>
                            <tr>
                                <th>MPAA Rating:</th>
                                <td id="dvd-mpaaRating"></td>
                            </tr>
                            <tr>
                                <th>Director:</th>
                                <td id="dvd-director"></td>
                            </tr>
                            <tr>
                                <th>Studio:</th>
                                <td id="dvd-studio"></td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            Close
                        </button>
                    </div>
                </div>
            </div>
        </div>



        <div class="modal fade" id="editModal" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">
                            <span>&times;</span>
                            <span class="sr-only">Close</span>
                        </button>
                        <h4 class="modal-title" id="editModalLabel">Edit Dvd</h4>
                    </div>
                    <div class="modal-body">
                        <h3 id="dvd-id"></h3>
                        <form class="form-horizontal" role="form">

                            <div class="form-group">
                                <label for="edit-title" class="col-md-4 control-label">
                                    Title:
                                </label>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" id="edit-title" placeholder="Title">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="edit-releaseDate" class="col-md-4 control-label">
                                    Release Date:
                                </label>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" id="edit-releaseDate" placeholder="Release Date">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="edit-mpaaRating" class="col-md-4 control-label">
                                    MPAA Rating:
                                </label>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" id="edit-mpaaRating" placeholder="MPAA Rating">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="edit-director" class="col-md-4 control-label">
                                    Director:
                                </label>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" id="edit-director" placeholder="Director">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="edit-studio" class="col-md-4 control-label">
                                    Studio:
                                </label>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" id="edit-studio" placeholder="Studio">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="edit-note" class="col-md-4 control-label">
                                    Note:
                                </label>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" id="edit-note" placeholder="Note">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-offset-4 col-md-8">
                                    <button type="submit" id="edit-button" class="btn btn-primary" data-dismiss="modal">
                                        Edit Dvd
                                    </button>
                                    <button type="button" class="btn btn-primary" data-dismiss="modal">
                                        Cancel
                                    </button>
                                    <input type="hidden" id="edit-id" >
                                </div>
                            </div>

                        </form>

                    </div>
                    <div class="modal-footer">
                    </div>

                </div>
            </div>
        </div>



        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/dvdLibrary.js"></script>

    </body>
</html>

