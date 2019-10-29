import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-my-pie-chart',
  templateUrl: './my-pie-chart.component.html',
  styleUrls: ['./my-pie-chart.component.css']
})
export class MyPieChartComponent implements OnInit {

  public pieChartLabels = ['Vendas Q1', 'Vendas Q2', 'Vendas Q3', 'Vendas Q4'];
  public pieChartData = [120, 150, 180, 90];
  public pieChartType = 'pie';

  constructor() { }

  ngOnInit() {
  }

}
