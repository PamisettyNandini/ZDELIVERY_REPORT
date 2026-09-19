REPORT zdelivery_report.

TABLES: likp, lips.

SELECT-OPTIONS:
  s_vbeln FOR likp-vbeln,
  s_wadat FOR likp-wadat,
  s_kunnr FOR likp-kunnr.

TYPES: BEGIN OF ty_delivery,
         vbeln TYPE likp-vbeln,
         wadat TYPE likp-wadat,
         kunnr TYPE likp-kunnr,
         matnr TYPE lips-matnr,
         lfimg TYPE lips-lfimg,
         werks TYPE lips-werks,
       END OF ty_delivery.

DATA: gt_delivery TYPE TABLE OF ty_delivery.

START-OF-SELECTION.

  SELECT a~vbeln,
         a~wadat,
         a~kunnr,
         b~matnr,
         b~lfimg,
         b~werks
    FROM likp AS a
    INNER JOIN lips AS b
      ON a~vbeln = b~vbeln
    INTO TABLE @gt_delivery
    WHERE a~vbeln IN @s_vbeln
      AND a~wadat IN @s_wadat
      AND a~kunnr IN @s_kunnr.

  IF gt_delivery IS NOT INITIAL.

    TRY.

        cl_salv_table=>factory(
          IMPORTING
            r_salv_table = DATA(lo_alv)
          CHANGING
            t_table      = gt_delivery ).

        lo_alv->get_functions( )->set_all( abap_true ).

        lo_alv->get_columns( )->set_optimize( abap_true ).

        lo_alv->display( ).

      CATCH cx_salv_msg INTO DATA(lx_salv_msg).

        MESSAGE lx_salv_msg->get_text( ) TYPE 'I'.

    ENDTRY.

  ELSE.

    MESSAGE 'No records found for the given selection.' TYPE 'I'.

  ENDIF.
