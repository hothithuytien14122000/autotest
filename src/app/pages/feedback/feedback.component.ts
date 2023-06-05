import { ChangeDetectionStrategy, Component, OnInit, TemplateRef, ViewChild, ViewEncapsulation } from '@angular/core';
import { CodeTypesFacade, GlobalFacade, MedicalProcedureFacade, Orders, OrdersFacade } from '@store';
import { ActivatedRoute, Router } from '@angular/router';
import { DataTableModel, FormModel, TableItem } from '@model';
import * as moment from 'moment';
import { Subject, take, takeUntil, withLatestFrom } from 'rxjs';
import { FormGroup } from '@angular/forms';
import { query } from '@angular/animations';


@Component({
  selector: 'app-feedback',
  templateUrl: './feedback.component.html',
  providers: [OrdersFacade, MedicalProcedureFacade, CodeTypesFacade],
  encapsulation: ViewEncapsulation.None,
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class FeedbackComponent implements OnInit{
  @ViewChild('implementationDate') implementationDate!: TemplateRef<HTMLTemplateElement>;
  @ViewChild('address') address!: TemplateRef<HTMLTemplateElement>;
  @ViewChild('finishDay') finishDay!: TemplateRef<HTMLTemplateElement>;
  @ViewChild('orderNo') orderNo!: TemplateRef<HTMLTemplateElement>;

  columnsTable: DataTableModel<Orders>[] = [];
  fitlerStatus = '';
  id?: string = '';
  private destroyed$ = new Subject<void>();

  @ViewChild('tableOrders') tableOrders!: any;

  constructor(
    // protected route: ActivatedRoute,
    protected router: Router,
    public OrdersFacade: OrdersFacade,
    public globalFacade: GlobalFacade,
    public medicalProcedureFacade: MedicalProcedureFacade,
    public codeTypesFacade: CodeTypesFacade,
  ) {}

  ngOnInit() {
    this.globalFacade.setBreadcrumbs([
      {
        title: 'routes.admin.feedback.feedback-management',
        link: '/order',
      },
      {
        title: 'routes.admin.feedback.feedback-list',
        link: '/order',
      },
    ]);
    this.OrdersFacade.getFeedBack({});
    this.table();
  }

  table() {
    setTimeout(() => {
      this.columnsTable = [
        {
          name: 'orderNo',
          title: 'Mã đơn',
          tableItem: {
            width: '120px',
            renderTemplate: this.orderNo,
          },
        },
        {
          name: 'implementationDate',
          title: 'Ngày thực hiện',
          tableItem: {
            renderTemplate: this.implementationDate,
            // render: (data) => this.transform(data.implementationDate),
          },
        },
        {
          name: 'medicalProcedureGroup',
          title: 'Nhóm thủ thuật',
          tableItem: {
            width: '180px',
            align: 'center',
            render: (data) => data?.medicalProcedureGroup?.title,
          },
        },
        {
          name: 'medicalProcedure',
          title: 'Loại thủ thuật',
          tableItem: {
            width: '150px',
            align: 'center',
            render: (data) => data?.medicalProcedure?.name,
          },
        },
        {
          name:'',
          title: 'Độ khó',
          tableItem: {
            render: (data) => data?.medicalRecord?.difficulty?.title,
          }
        },
        {
          name: '',
          title: 'Địa chỉ thực hiện',
          tableItem: {
            width: '325px',
            renderTemplate: this.address,
            // render: (data) => `<span>${data?.?.title}</span>`,
          },
        },
        {
          name: 'statusCode',
          title: 'Ngày hoàn thành',
          tableItem: {
            width: '135px',
            align: 'center',
            renderTemplate: this.finishDay
            //render: (data) => data?.receivedOnDate,
          },
        },
        {
          name: '',
          title: 'routes.admin.order.action',
          tableItem: {
            align: 'center',
            actions: [
              {
                icon: () => 'las la-hospital-alt',
                color: () => '#40A9FF',
                text: () => 'Bệnh viện',
              },
              {
                icon: () => 'las la-user-nurse',
                color: () => '#40A9FF',
                text: () => 'Bác sĩ',
              },
            ],
          },
        },
      ];
    });
  }

  classRow(data: Orders, { id }: { id: string }) {
    // console.log(this.id);
    return data.id === id ? 'bg-blue-100' : '';
  }

  async tableFilter(data: string) {
    this.fitlerStatus = data;
    await this.tableOrders?.filter('statusCode', null, data);
    return this.tableOrders.total;
  }

  transform(value: any, query = 'DD/MM/YYYY HH:mm'): any {
    return value ? moment(value).format(query) : '';
  }
  transformTimeDay(value: any, query = 'HH:mm DD/MM/YYYY'): any {
    return value ? moment(value).format(query) : '';
  }
}
