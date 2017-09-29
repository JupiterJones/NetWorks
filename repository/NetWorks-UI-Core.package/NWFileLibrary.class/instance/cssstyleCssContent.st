uploaded
cssstyleCssContent
	^ '/* SASS NetWorks toolkit */
/* ContractorManager Theme */
/* Flat Theme */
@import url(http://fonts.googleapis.com/css?family=Bitter:400,700|Open+Sans:400,300,600,700);
/* NetWorks page layout */
/* NetWorks report */
.magritte .buttons {
  text-align: right;
}
.magritte .buttons input {
  height: 32px;
  background: none;
  border: none;
  background-repeat: no-repeat;
  background-position: left;
  margin-left: 10px;
  cursor: pointer;
}
.magritte .buttons input:nth-of-type(1) {
  float: right;
  background-image: url(/files/CCFileLibrary/images/save.png);
  background-size: contain;
  padding-left: 35px;
}
.magritte .buttons input:nth-of-type(2) {
  background-image: url(/files/CCFileLibrary/images/cancel.png);
  background-size: contain;
  padding-left: 30px;
}

.magritte dt.reportComponent {
  text-align: center;
  font-weight: bold;
  font-size: 1.5em;
  padding-bottom: 20px;
  display: none;
}

.selection-actions {
  float: right;
}
.selection-actions .dropdown-menu {
  left: auto;
  right: 0;
}

table.report, .reportComponent table {
  width: 100%;
}
table.report th, .reportComponent table th {
  padding-bottom: 5px;
  border-bottom: 1px solid rgba(0, 0, 0, 0.05);
}
table.report td, .reportComponent table td {
  padding: 3px 0px;
}
table.report tfoot, .reportComponent table tfoot {
  text-align: center;
}
table.report tfoot td, .reportComponent table tfoot td {
  padding-top: 2em;
}
table.report th, table.report tbody td, .reportComponent table th, .reportComponent table tbody td {
  text-align: center;
}
table.report th:first-child, table.report tbody td:first-child, .reportComponent table th:first-child, .reportComponent table tbody td:first-child {
  text-align: left;
}
table.report th:nth-child(2), table.report tbody td:nth-child(2), .reportComponent table th:nth-child(2), .reportComponent table tbody td:nth-child(2) {
  text-align: left;
}
table.report th:last-child, table.report tbody td:last-child, .reportComponent table th:last-child, .reportComponent table tbody td:last-child {
  text-align: right;
}
table.report th:last-child a, table.report tbody td:last-child a, .reportComponent table th:last-child a, .reportComponent table tbody td:last-child a {
  padding-left: 8px;
}
table.report tbody tr td:last-child, .reportComponent table tbody tr td:last-child {
  opacity: 0.5;
}
table.report tbody tr:hover, .reportComponent table tbody tr:hover {
  background-color: rgba(0, 0, 0, 0.05);
}
table.report tbody tr:hover td:last-child, .reportComponent table tbody tr:hover td:last-child {
  opacity: 1;
}

/* NetWorks brand */
.logo-lg img, .logo-mini img {
  width: auto;
  max-height: 40px;
}

/* NetWorks form */
.magritte h3 {
  padding-top: 10px;
}
.magritte dl dt {
  padding-top: 25px;
  padding-bottom: 5px;
}
.magritte dl textarea {
  width: 100%;
}

.box-header.with-border {
  border-bottom: 1px solid rgba(0, 0, 0, 0.15);
  background: -moz-linear-gradient(top, transparent 60%, rgba(0, 0, 0, 0.05) 100%);
  /* FF3.6-15 */
  background: -webkit-linear-gradient(top, transparent 60%, rgba(0, 0, 0, 0.05) 100%);
  /* Chrome10-25,Safari5.1-6 */
  background: linear-gradient(to bottom, transparent 60%, rgba(0, 0, 0, 0.05) 100%);
  /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
}

.form-buttons {
  border-top: 1px solid rgba(0, 0, 0, 0.15);
  padding-top: 12px;
  margin-left: -10px;
  padding-left: 10px;
  margin-right: -10px;
  padding-right: 10px;
  background: -moz-linear-gradient(top, rgba(0, 0, 0, 0.05) 0%, transparent 40%);
  /* FF3.6-15 */
  background: -webkit-linear-gradient(top, rgba(0, 0, 0, 0.05) 0%, transparent 40%);
  /* Chrome10-25,Safari5.1-6 */
  background: linear-gradient(to bottom, rgba(0, 0, 0, 0.05) 0%, transparent 40%);
  /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
}
.form-buttons button {
  margin-left: 0px;
  margin-right: 12px;
}
.form-buttons button:nth-of-type(1), .form-buttons button:nth-of-type(2) {
  float: right;
  margin-left: 12px;
  margin-right: 0px;
}

textarea {
  width: 100%;
  border: 1px solid #ccc;
  border-radius: 4px;
  padding: 6px 12px;
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
}

/* NetWorks Integration Panel */
.integrationPanel {
  display: flex;
  justify-content: space-between;
}
.integrationPanel .integrationLogo {
  background-color: white;
  border: 1px solid rgba(0, 0, 0, 0.5);
  border-radius: 6px;
  padding: 12px;
}

/* Dashboard Visualisations */
div.InfoVis {
  background-color: transparent;
  width: 100%;
  height: 300px;
  overflow: hidden;
}

div.tip {
  display: block;
  font-size: 0.7em;
  max-width: 300px;
  max-height: 200px;
  overflow: hidden;
  background-color: white;
  opacity: 0.7;
  padding: 5px;
  border-style: solid;
  border-width: 1px;
  border-color: black;
  -moz-box-shadow: 2px 2px 8px #555555;
}

div.legend-color {
  border: 1px solid rgba(0, 0, 0, 0.5);
  margin: 3px 3px 0 0;
  padding: 0 0 0 0;
  width: 1em;
  height: 1em;
  float: left;
}

div.legend-label {
  margin-top: 0px;
}

li.legend {
  padding: 0px;
}

ul.legend {
  border: 1px solid #555555;
  list-style-type: none;
  padding: 5px;
  margin: 0px;
  width: 10em;
}

/* Generic Panel  */
input.search {
  color: black;
}

.answerBtn {
  position: absolute;
  right: 16px;
  top: 70px;
}

.assignmentAndScheduling {
  display: flex;
  flex-direction: column;
}
.assignmentAndScheduling .panel-heading, .assignmentAndScheduling .panel-footer {
  padding: 1px 8px;
}
.assignmentAndScheduling .panel-heading p, .assignmentAndScheduling .panel-footer p {
  font-size: 8pt;
  margin: 0;
  padding: 0;
}
.assignmentAndScheduling .panel-heading .filters, .assignmentAndScheduling .panel-footer .filters {
  float: right;
  margin-top: 6px;
}
.assignmentAndScheduling .panel-body {
  padding: 0;
  height: 200px;
  overflow-y: auto;
  overflow-x: hidden;
}
.assignmentAndScheduling .panel-report .report-row {
  display: flex;
  align-items: center;
  padding: 4px 12px;
  z-index: 9999;
}
.assignmentAndScheduling .panel-report .report-row .icon span {
  margin-right: 4px;
}
.assignmentAndScheduling .panel-report .report-row .labels {
  flex-grow: 100;
  display: flex;
  flex-direction: column;
}
.assignmentAndScheduling .panel-report .report-row .labels .title {
  font-weight: bold;
  line-height: 0.8em;
}
.assignmentAndScheduling .panel-report .report-row .labels .comment {
  font-size: 0.75em;
}
.assignmentAndScheduling .panel-report .report-row .columns {
  display: flex;
}
.assignmentAndScheduling .panel-report .report-row .columns .col {
  padding-left: 10px;
}
.assignmentAndScheduling .panel-report .report-row .fa {
  opacity: 0.9;
  color: #428bca;
}
.assignmentAndScheduling .ui-selected {
  background-color: rgba(0, 0, 0, 0.05);
}
.assignmentAndScheduling .focus .ui-selected {
  background-image: linear-gradient(#428bca 0%, #357ebd 100%);
  color: white;
}
.assignmentAndScheduling .focus .ui-selected .fa {
  opacity: 0.9;
  color: rgba(255, 255, 255, 0.65);
}

.dropHover {
  box-shadow: inset 0px 0px 6px 3px rgba(0, 0, 0, 0.15);
}

.jobs > div:not(:last-child), .workOrders > div:not(:last-child) {
  margin-right: 16px;
}

.jobs {
  display: flex;
}
.jobs .jobsList {
  flex-grow: 1;
  min-width: 550px;
}
.jobs .jobLineItems {
  flex-grow: 1;
}

.workOrders {
  display: flex;
}
.workOrders .contractors {
  flex-grow: 1;
}
.workOrders .workOrderList {
  flex-grow: 1;
}
.workOrders .workOrderLineItems {
  flex-grow: 1;
}

/* Calendar  */
#calendar {
  height: 400px;
  width: 100%;
  font-size: 0.85em;
}
#calendar h2 {
  font-size: 1.5em;
}

.ui-dialog, .dropdown-menu {
  z-index: 10;
}

.calendar {
  margin-bottom: 80px;
}
.calendar td {
  text-align: right;
  border-right: 1px solid rgba(0, 0, 0, 0.05);
}
.calendar td a {
  background-image: linear-gradient(#428bca 0%, #357ebd 100%);
  color: white;
  padding: 2px;
  text-align: left;
}
.calendar td a:hover {
  background-color: rgba(0, 0, 0, 0.05);
  background-image: none;
  color: black;
}

/*# sourceMappingURL=style.css.map */
'