package control.actions;

import java.util.Map;

import model.managers.CategoryManager;
import model.models.Category;
import model.models.User;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.IntRangeFieldValidator;
import com.opensymphony.xwork2.validator.annotations.RequiredFieldValidator;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.ValidatorType;

public class AddCategoryAction extends ActionSupport implements SessionAware {

	private Map<String, Object> session;
	private String catName;
	private int unitCost;

	@org.apache.struts2.convention.annotation.Action(value = "add_category", results = {
			@Result(name = "error", location = "login", type = "redirect"),
			@Result(name = "done", location = "home", type = "redirect") })
	public String createUser() throws Exception {

		CategoryManager cm = new CategoryManager();
		User user = (User) session.get("user");
		if (user != null
				&& (user.getUserPrivilege().isAdd_user() || user
						.getUserPrivilege().isRemove_user())) {

			String change = (String) session.get("change");

			Category temp = new Category();
			temp.setCatName(catName);
			temp.setUnitCost(unitCost);
			;
			temp.setAddBy(user.getUserName());

			if (change == null) {

				if (cm.addCategory(temp)) {

					session.put("message", "Category " + temp.getCatName()
							+ " added successfully!");
					return "done";
				}
			} else {

				temp.setID(Integer.parseInt(change));
				if (cm.updateCategory(temp)) {
					session.put("message", "Category " + temp.getCatName()
							+ " updated successfully!");
					session.remove("change");
					return "done";
				}
			}
			return SUCCESS;
		} else {
			return ERROR;
		}
	}

	@org.apache.struts2.convention.annotation.Action(value = "add-category-input", results = { @Result(name = "error", location = "login", type = "redirect") })
	public String input() throws Exception {

		User user = (User) session.get("user");
		if (user != null
				&& (user.getUserPrivilege().isAdd_user() || user
						.getUserPrivilege().isRemove_user())) {

			return "add_category";
		} else {
			return ERROR;
		}

	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;

	}

	public String getCatName() {
		return catName;
	}

	@RequiredStringValidator(type = ValidatorType.FIELD, message = "Name cannot be empty")
	public void setCatName(String catName) {
		this.catName = catName;
	}

	public int getUnitCost() {
		return unitCost;
	}

	@IntRangeFieldValidator(min = "1", message = "Positve numbers only")
	public void setUnitCost(int unitCost) {
		this.unitCost = unitCost;
	}
}
