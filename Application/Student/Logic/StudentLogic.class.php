<?php

namespace Student\Logic;

use Student\Model\StudentModel;

class StudentLogic extends StudentModel
{
	protected  $errors = array();

    public function getErrors()
	{
		return $this->errors;
	}

    public function deleteInfo($id)
	{
		$map['id'] = $id;
		$datas=$this->where($map)->delete();
		return $datas;
	}

    /**
     * 更新用户信息
     * @param   $list 用户信息
     * @return true:$this false 
     */
    public function updateList($list)
    {
        $id = $list["id"];
        if (!(int)$id)
        {
            $this->setError("UserLogic->updateList:Must has key of id.(必须传入ID)");
            return $this;
        } 

        //取当前ID对应的信息
        $user = $this->getListById($id);

        //判断原密码是否正确
        $password = $this->makePassword($list['password']);
        if ($password !== $user['password'])
        {
            $this->setError("UserLogic->updateList:The old password is incorrect.(原密码输入错误)");
            return $this;
        }

        //如果传入的新密码为空，则不重置密码;非空，则重置密码
        $repassword = isset($list['repassword']) ? trim($list['repassword']) : '';
        if ($repassword !== "")
        {
            $user['password'] = $this->makePassword($repassword);
        }

        //取其它更新的数据
        $user['email'] = $list['email'];
        $user['phonenumber'] = $list['phonenumber'];

        //更新数据
        try
        {
            if ($this->create($user))
            {
                $this->save();
            }
            else
            {   
                $this->setError("UserLogic->updateList:Data create error(数据创建错误):" . $this->getError());
                return $this;
            }
            
        }
        catch(\Think\Exception $e)
        {
            $this->setError("UserLogic->updateList:data save error, msg(数据保存过程中出错，错误信息）:" . $e->getMessage());
            return $this;
        }

        return $this;
    }

     /**
     * 通过ID获取用户的NAME值
     * @param  int $id 
     * @return list OR FALSE
     * PANJIE
     */
    public function getNameById($id)
    {
        $id = (int)$id;
        $map = array();
        $map["id"] = $id;
        if (!$list = $this->getListById($id))
        {
            $this->setError("UserLogic:The data of id:$id is not found(编号为$id的记录未找到:)" . $this->getError());
            return false;
        }

        return $list['name'];
    }

    /**
     * [resetPassword 重置密码]
     * 重置密码为mengyunzhi
     * @param  [type] $userId [用户id]
     * @return [type]         [description]
     */
    public function resetPassword($userId)
    {
        if ($userId == null)
        {
            $this ->error = "系统错误!";
            throw new \Think\Exception($this->error,1);
        }
        else
        {
            $data['id'] = $userId;
            $data['password'] = sha1(C(DEFAULT_PASSWORD));
            $this->save($data);
            return true;
        }
    }

    /**
     * 检查用户名与密码的正确性
     * @param  string  $username 用户名
     * @param  string  $password 密码
     * @param  boolean $useSha1  是否使用sha1加密
     * @return true flase           
     */
    public function checkUser($name, $password, $useSha1 = true)
    {
        //根据用户名获取用户密码与用户信息
        $user = array();
        $user = $this->getListByName($name);

        if($user === null)
        {
            return false;
        }
        else if($useSha1 === true)
        {
            if ($user['password'] == $this->makePassword($password))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else
        {
            if ($user['password'] === $password)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }

    //根据用户名取用户信息
    //$name string
    public function getListByName($name)
    {
        $map = array();
        $map['name'] = $name;
        return $this->where($map)->find();
    }

    /**
     * 通过学号和密码来验证学生信息
     * 正确，则返回学生数据，不正确，返回 false
     * @param  int $num      学号
     * @param  stirng $password 密码
     * @return  正确，则返回学生数据，不正确，返回 false
     * panjie
     */
    public function validate($num, $password)
    {
        $map = array();
        $map['num'] = $num;

        $list = $this->where($map)->find();

        if ($list == null)
        {
            $this->setError = "data not found";
            return false;
        }

        if ($list['password'] !== $this->makePassword($password))
        {
            $this->setError("password increct");
            return false;
        }

        return $list;
    }

    /**
     * 按一定的算法，生成加密信息
     * @param  string $password 加密前字符
     * @return string           加密后字符 
     * panjie
     */
    public function makePassword($password)
    {
        return sha1($password);
    }

}