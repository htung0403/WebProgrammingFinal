package entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.text.NumberFormat;

public class Cart implements Serializable {

    private List<LinesItem> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public void setItems(List<LinesItem> lineItems) {
        items = lineItems;
    }

    public List<LinesItem> getItems() {
        return items;
    }

    public int getCount() {
        return items.size();
    }

    public void addItem(LinesItem item, String type) {
        //If the item already exists in the cart, only the quantity is changed.
        Integer code = item.getProduct().getId();
        String update = type.toString();
        int quantity = item.getQuantity();

        if(update.equals("true"))
        {
            for (int i = 0; i < items.size(); i++) {
                LinesItem lineItem = items.get(i);
                if (lineItem.getProduct().getId().equals(code))
                {
                    lineItem.setQuantity(quantity);
                    return;
                }
            }
        }
        else // add
        {
            for (int i = 0; i < items.size(); i++) {
                LinesItem lineItem = items.get(i);
                if (lineItem.getProduct().getId().equals(code))
                {
                    lineItem.setQuantity(lineItem.getQuantity() + quantity);
                    return;
                }
            }
            items.add(item); // new
        }
    }

    public void removeItem(LinesItem item) {
        Integer code = item.getProduct().getId();
        for (int i = 0; i < items.size(); i++) {
            LinesItem lineItem = items.get(i);
            if (lineItem.getProduct().getId().equals(code)) {
                items.remove(i);
                return;
            }
        }
    }
    public double totalBillWithoutShip()
    {
        double sum = 0;
        for (var item: items)
        {
            sum += item.getSubtotal();
        }
        return sum;
    }
    public String getTotalWithoutShipCurrencyFormat() {
        NumberFormat currency = NumberFormat.getCurrencyInstance();
        return currency.format(this.totalBillWithoutShip());
    }
    public double Shipping(){
        if(totalBillWithoutShip()<70) {
            return this.totalBillWithoutShip() * 0.1;
        }
        else {
            return 0;
        }
    }
    public String getTotalCurrentFormat(){
        NumberFormat currency = NumberFormat.getCurrencyInstance();
        return currency.format(this.totalBillWithoutShip()+ this.Shipping());
    }
    public String getShipCurrentFormat(){
        NumberFormat currency = NumberFormat.getCurrencyInstance();
        return currency.format(this.Shipping());
    }
}
