WITH
    cte_non_txns_customer
    AS
        (SELECT v.visit_id,
                v.customer_id,
                t.transaction_id,
                t.amount
           FROM visits v, transactions t
          WHERE v.visit_id = t.visit_id(+) AND transaction_id IS NULL)
  SELECT cntc.customer_id, COUNT (cntc.customer_id) count_no_trans
    FROM cte_non_txns_customer cntc
GROUP BY cntc.customer_id;
